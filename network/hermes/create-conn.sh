#!/bin/bash
set -e

# Load shell variables
. ./network/hermes/variables.sh

### Configure the clients and connection
echo "Initiating connection handshake..."
#$HERMES_BINARY --config $CONFIG_DIR create connection --a-chain quicksilver-1 --b-chain stargaze-1
$HERMES_BINARY --config $CONFIG_DIR create connection --a-chain ibc1 --b-chain ibc2

sleep 2
