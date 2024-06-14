#!/bin/bash

source "$(dirname $0)/ensure_is_in_container.sh"

dirs=$(find $MAIN_DIR -maxdepth 2 -name 'package.json' -exec dirname {} \;)

echo "$dirs" | xargs -I {} -P 4 bash -c 'cd "{}" && echo "Installing dependencies for {}" && npm install'