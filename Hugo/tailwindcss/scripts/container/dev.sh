#!/usr/bin/env bash
# Container script to run the hugo development server
set -euo pipefail
cd /home/aj/site/
npx --no-install @tailwindcss/cli -i ./themes/example/assets/css/input.css -o ./themes/example/assets/css/main.css --watch=always &
hugo server --bind "0.0.0.0"
