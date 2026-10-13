#!/bin/sh
# Wraps src/page.html in a full HTML document as index.html (the deployable site).
set -e
cd "$(dirname "$0")"
{
  printf '<!doctype html>\n<html lang="he" dir="rtl">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">\n<meta name="description" content="בית בישראל – יזמות נדל&quot;ן והתחדשות עירונית באשדוד. בונים עתיד, יוצרים קהילה.">\n</head>\n<body>\n'
  cat src/page.html
  printf '\n</body>\n</html>\n'
} > index.html
