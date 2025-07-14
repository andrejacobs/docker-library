#!/usr/bin/env bash
# Container script to run hugo and generate the site
set -euo pipefail
cd /home/aj/site/
hugo --gc --minify --templateMetrics --templateMetricsHints --forceSyncStatic
