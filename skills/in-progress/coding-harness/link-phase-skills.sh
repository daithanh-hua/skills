#!/usr/bin/env bash
# Link every skill named in phases.md into the open project's .cursor/skills.
# A real directory already there is left alone. A symlink is refreshed.
# deprecated/ and misc/ are not sources. Links are local (.git/info/exclude).
set -euo pipefail

if [[ $# -ne 1 || ! -d "$1" ]]; then
  echo "usage: link-phase-skills.sh <project-root>" >&2
  exit 1
fi

PROJECT="$(cd "$1" && pwd)"
HERE="$(cd "$(dirname "$0")" && pwd)"
LIBRARY="$(cd "$HERE/../../.." && pwd)"
PHASES="$HERE/phases.md"
DEST="$PROJECT/.cursor/skills"

if [[ ! -f "$PHASES" || ! -d "$LIBRARY/skills" ]]; then
  echo "error: phases.md or the skills library is missing beside this script." >&2
  exit 1
fi

mkdir -p "$DEST"

mapfile -t NAMES < <(python3 - "$PHASES" "$LIBRARY" <<'PY'
import re, sys
from pathlib import Path
text = open(sys.argv[1], encoding="utf-8").read()
library = Path(sys.argv[2]) / "skills"
installed = set()
for skill_md in library.rglob("SKILL.md"):
    if "deprecated" in skill_md.parts or "misc" in skill_md.parts:
        continue
    installed.add(skill_md.parent.name)
slash = set(re.findall(r"(?<![\w`])/([a-z0-9]+(?:-[a-z0-9]+)*)", text))
ticks = set(re.findall(r"`/?([a-z0-9]+(?:-[a-z0-9]+)*)`", text))
names = set(slash)
names.update(name for name in ticks if "-" in name or name in installed)
for name in sorted(names):
    print(name)
PY
)

declare -A SOURCE=()
while IFS= read -r -d '' skill_md; do
  src="$(dirname "$skill_md")"
  SOURCE["$(basename "$src")"]="$src"
done < <(find "$LIBRARY/skills" -name SKILL.md -not -path '*/deprecated/*' -not -path '*/misc/*' -print0)

# A phase skill that lives outside this library is still installed when the
# user already has it for another harness.
for user_dir in "$HOME/.agents/skills" "$HOME/.claude/skills"; do
  [[ -d "$user_dir" ]] || continue
  for name in "${NAMES[@]}"; do
    [[ -n "${SOURCE[$name]:-}" ]] && continue
    if [[ -f "$user_dir/$name/SKILL.md" ]]; then
      SOURCE["$name"]="$(cd "$user_dir/$name" && pwd)"
    fi
  done
done

EXCLUDE="$PROJECT/.git/info/exclude"
if [[ -d "$PROJECT/.git" ]]; then
  mkdir -p "$(dirname "$EXCLUDE")"
  touch "$EXCLUDE"
fi

for name in "${NAMES[@]}"; do
  src="${SOURCE[$name]:-}"
  target="$DEST/$name"
  rel=".cursor/skills/$name"
  if [[ -z "$src" ]]; then
    echo "no source: $name"
    continue
  fi
  if [[ -e "$target" && ! -L "$target" ]]; then
    echo "left in place: $name"
    continue
  fi
  link="$(realpath --relative-to="$DEST" "$src")"
  if [[ -L "$target" ]]; then
    ln -sfn "$link" "$target"
    echo "already: $name"
  else
    ln -sfn "$link" "$target"
    echo "installed: $name -> $src"
  fi
  if [[ -f "$EXCLUDE" ]] && ! grep -qxF "$rel" "$EXCLUDE"; then
    printf '%s\n' "$rel" >> "$EXCLUDE"
  fi
done
