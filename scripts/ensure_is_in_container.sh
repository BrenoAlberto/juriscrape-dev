#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/../.env"

vars=("RUNNING_IN_DOCKER" "MAIN_DIR")

for var in "${vars[@]}"; do
  if [ -z "${!var}" ]; then
    printf "This script should be run inside the dev container. %s is not set.\n" "$var" >&2
    exit 1
  fi
done