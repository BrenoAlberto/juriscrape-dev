#!/bin/bash

USER_ID=$(id -u)
GROUP_ID=$(id -g)
USER_NAME="juriscrape-dev"

MAIN_DIR="/home/$USER_NAME/juriscrape"
DEV_DIR="$MAIN_DIR/juriscrape-dev"

ENV_FILE="./.env"
ENV_DEVCONTAINER_FILE="./.devcontainer/devcontainer.env"

> $ENV_FILE

env_vars=(
  "USER_ID" "GROUP_ID" "USER_NAME" 
  "MAIN_DIR" "DEV_DIR"
)

for var in "${env_vars[@]}"; do
  echo "$var=${!var}" >> $ENV_FILE
done

> $ENV_DEVCONTAINER_FILE

env_devcontainer_vars=(
  "USER_ID" "GROUP_ID" "USER_NAME" 
  "MAIN_DIR" "DEV_DIR"
)

for var in "${env_devcontainer_vars[@]}"; do
  echo "$var=${!var}" >> $ENV_DEVCONTAINER_FILE
done