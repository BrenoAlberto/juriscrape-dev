#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/ensure_is_in_container.sh"

dirs=$(jq -r '.[]' $MAIN_DIR/local_paths.json | sed "s|^|$MAIN_DIR/|")

# TODO: running this in parallel seems to cause some issues with
# npm, particularly with puppeteer (check PUPPETEER_SKIP_CHROMIUM_DOWNLOAD);
# for now run serially

for dir in $dirs; do
    pushd $dir > /dev/null
    if [ -f "package.json" ]; then
        echo "Installing dependencies for $dir"
        npm install
    fi
    popd > /dev/null
done