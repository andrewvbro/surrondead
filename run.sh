#!/usr/bin/env bash
# Launch SURRONDEAD locally and open it in your browser.
cd "$(dirname "$0")"
URL="http://localhost:5680"
echo "Starting SURRONDEAD on $URL ..."

open_browser() {
  if command -v xdg-open >/dev/null 2>&1; then xdg-open "$URL"
  elif command -v open >/dev/null 2>&1; then open "$URL"
  fi
}

if command -v node >/dev/null 2>&1; then
  ( sleep 1; open_browser ) &
  exec node server.js
elif command -v python3 >/dev/null 2>&1; then
  ( sleep 1; open_browser ) &
  exec python3 -m http.server 5680
elif command -v python >/dev/null 2>&1; then
  ( sleep 1; open_browser ) &
  exec python -m http.server 5680
else
  echo "Node.js or Python is required to run the game."
fi
