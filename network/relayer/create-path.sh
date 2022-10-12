#!/bin/bash
set -e

# Load shell variables
. ./network/relayer/variables.sh

### Configure the clients and connection
echo "Initiating client & connection handshake..."
$RELAYER_BINARY tx connection "$PATH_NAME" --home "$RELAYER_CONFIG_DIR" -d

sleep 5

# Initiate a handshake for a new fee enabled transfer channel using the existing connection
echo "Initiating channel handshake..."
$RELAYER_BINARY tx channel $PATH_NAME --src-port transfer --dst-port transfer --version "{\"fee_version\":\"fee29-1\",\"app_version\":\"ics20-1\"}" --home "$RELAYER_CONFIG_DIR" -d

sleep 5

# At this point the chains are running, the relayer is configured, and we have created a path between both chains,
# including a new channel that has support for fee incentives.