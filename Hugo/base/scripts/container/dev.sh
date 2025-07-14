#!/usr/bin/env bash
# Container script to run the hugo development server
set -euo pipefail
cd /home/aj/site/
hugo server --bind "0.0.0.0"
