#!/bin/bash
# update_cv_pdf.sh — Generate cv.pdf from content/vita.md
# Resolves Hugo {{< include file="..." >}} shortcodes, then runs pandoc.
# Usage: bash static/files/update_cv_pdf.sh  (from repo root)

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
CV_DIR="$REPO_ROOT/static/files"
VITA_MD="$REPO_ROOT/content/vita.md"

# Resolve Hugo include shortcodes and strip YAML frontmatter
resolve_includes() {
  local in_frontmatter=true
  local frontmatter_count=0
  while IFS= read -r line; do
    if $in_frontmatter; then
      if [[ "$line" == "---" ]]; then
        frontmatter_count=$((frontmatter_count + 1))
        [[ $frontmatter_count -ge 2 ]] && in_frontmatter=false
        continue
      fi
      continue
    fi
    if [[ "$line" =~ \{\{\<\ *include\ +file=\"([^\"]+)\"\ *\>\}\} ]]; then
      cat "$REPO_ROOT/${BASH_REMATCH[1]}"
    else
      echo "$line"
    fi
  done < "$VITA_MD"
}

echo "Resolving includes..."
resolve_includes > "$CV_DIR/vita.md"

echo "Running pandoc..."
cd "$CV_DIR"
pandoc vita.md --template cv-template.tex -f markdown-startnum -o cv.pdf

rm vita.md
echo "Generated $CV_DIR/cv.pdf"
