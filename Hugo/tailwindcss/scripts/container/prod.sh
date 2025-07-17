#!/usr/bin/env bash
# Container script to run hugo and generate the site
set -euo pipefail
cd /home/aj/site/
npx --no-install @tailwindcss/cli -i ./themes/example/assets/css/input.css -o ./themes/example/assets/css/main.css
hugo --gc --minify --templateMetrics --templateMetricsHints --forceSyncStatic
