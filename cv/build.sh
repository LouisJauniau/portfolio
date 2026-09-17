#!/usr/bin/env bash
# Regenere CV_Louis_Jauniau.pdf a partir de cv/cv.html.
# Si la photo change, la retoucher d'abord : python cv/retouch.py <photo_source>
set -e
cd "$(dirname "$0")/.."
ROOT=$(pwd -W)
CHROME="/c/Program Files/Google/Chrome/Application/chrome.exe"
"$CHROME" --headless --disable-gpu --no-pdf-header-footer --virtual-time-budget=8000 \
  --print-to-pdf="$ROOT/CV_Louis_Jauniau.pdf" "file:///$ROOT/cv/cv.html" 2>/dev/null
python -c "import pypdf,sys;print('pages:',len(pypdf.PdfReader(sys.argv[1]).pages))" "$ROOT/CV_Louis_Jauniau.pdf"
