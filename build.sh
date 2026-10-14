#!/bin/sh
# Wraps the page sources in full HTML documents for the static site:
#   src/page.html        -> index.html      (the current design)
#   src/designs/X.html   -> design-X.html   (alternative designs under review)
# src/switcher.html (the temporary design switcher) is appended to every page.
set -e
cd "$(dirname "$0")"
wrap() {
  {
    printf '<!doctype html>\n<html lang="he" dir="rtl">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">\n<meta name="description" content="בית בישראל – יזמות נדל&quot;ן והתחדשות עירונית באשדוד. בונים עתיד, יוצרים קהילה.">\n</head>\n<body>\n'
    cat "$1"
    [ -f src/signature.html ] && cat src/signature.html
    [ -f src/switcher.html ] && cat src/switcher.html
    printf '\n</body>\n</html>\n'
  } > "$2"
}
wrap src/page.html index.html
for f in src/designs/*.html; do
  [ -e "$f" ] || continue
  wrap "$f" "design-$(basename "$f")"
done
