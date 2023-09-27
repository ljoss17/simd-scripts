#!/bin/bash

set -e

# Load shell variables
. ./network/rly/variables.sh

# Start the relayer
echo "Starting relayer..."

$RELAYER_BINARY start "$PATH_NAME" --home "$RELAYER_CONFIG_DIR" -d
