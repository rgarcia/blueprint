#!/bin/bash --
set -e -u -o pipefail

CONFIG_DIR="/opt/science/blueprint/config"
SCIENCE_DIR="/opt/science"

cd -- "$(dirname -- "$0")"

eval "$(curl 169.254.169.254/latest/user-data/)"

export GOMAXPROCS="2"

exec ./schema_suggestor \
  -url="${SCOOP_URL}" \
  -transformConfig="${CONFIG_DIR}/transforms_available.json" \
  -staticfiles="${SCIENCE_DIR}/nginx/html/events"
