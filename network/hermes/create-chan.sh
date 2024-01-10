#!/bin/bash
set -e

# Load shell variables
. ./network/hermes/variables.sh

### Configure the clients and connection
echo "Initiating connection handshake..."
$HERMES_BINARY --config ./network/hermes/config.toml create channel --a-chain ibc1 --a-connection connection-0 --a-port transfer --b-port transfer

sleep 2
