@echo off
title SURRONDEAD
echo Starting SURRONDEAD on http://localhost:5680 ...
where node >nul 2>nul
if %errorlevel%==0 (
  start "" http://localhost:5680
  node server.js
  goto :eof
)
where python >nul 2>nul
if %errorlevel%==0 (
  start "" http://localhost:5680
  python -m http.server 5680
  goto :eof
)
echo.
echo Could not find Node.js or Python. Install either one, then run this again.
pause
