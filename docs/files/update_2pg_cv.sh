#!/bin/bash
# update_2pg_cv.sh — Generate a 2-page cv from content/vita.md
# Condenses the full CV (via make_2pg_vita.py), then runs pandoc.
# Usage: bash static/files/update_2pg_cv.sh   (from anywhere)

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
CV_DIR="$REPO_ROOT/static/files"

echo "Condensing vita..."
python3 "$CV_DIR/make_2pg_vita.py" > "$CV_DIR/2pg-vita.md"

echo "Running pandoc..."
cd "$CV_DIR"
pandoc 2pg-vita.md --template 2pg-cv-template.tex -f markdown-startnum -o 2pg-cv.pdf

PAGES=$(qpdf --show-npages 2pg-cv.pdf 2>/dev/null || echo "?")
echo "Generated $CV_DIR/2pg-cv.pdf ($PAGES pages)"
[[ "$PAGES" == "2" ]] || echo "WARNING: not 2 pages — tune the N_* counts in make_2pg_vita.py"
