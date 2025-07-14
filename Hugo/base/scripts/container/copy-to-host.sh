#!/usr/bin/env bash
# Container script to copy the site files to the host which should volume mount to /var/tmp/hugo/site
set -euo pipefail
mkdir -p /var/tmp/hugo
cp -R /home/aj/site /var/tmp/hugo/
