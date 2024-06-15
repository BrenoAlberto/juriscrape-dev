#!/bin/bash

set -e

USER_ID=$(id -u)
GROUP_ID=$(id -g)
USER_NAME="juriscrape-dev"

USER_HOME="/home/$USER_NAME"
MAIN_DIR="$USER_HOME/juriscrape"
DEV_DIR="$MAIN_DIR/tools/dev"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MAIN_LOCAL_DIR="$(cd "$SCRIPT_DIR/../../../" && pwd)"

ENV_FILE="$SCRIPT_DIR/../.env"
ENV_DEVCONTAINER_FILE="$SCRIPT_DIR/../.devcontainer/devcontainer.env"

> $ENV_FILE

env_vars=(
  "USER_ID" "GROUP_ID" "USER_NAME" "USER_HOME" "MAIN_LOCAL_DIR"
  "MAIN_DIR" "DEV_DIR"
)

for var in "${env_vars[@]}"; do
  echo "$var=${!var}" >> $ENV_FILE
done

> $ENV_DEVCONTAINER_FILE

env_devcontainer_vars=(
  "USER_ID" "GROUP_ID" "USER_NAME" "USER_HOME"
  "MAIN_DIR" "DEV_DIR"
)

for var in "${env_devcontainer_vars[@]}"; do
  echo "$var=${!var}" >> $ENV_DEVCONTAINER_FILE
done