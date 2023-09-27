#!/bin/bash
set -e

# Load shell variables
. ./network/rly/variables.sh

### Init the config file
$RELAYER_BINARY config init --home "$RELAYER_CONFIG_DIR"

### Add the chain configs
$RELAYER_BINARY chains add --file $RELAYER_DIRECTORY/chains/"$CHAIN1".json --home "$RELAYER_CONFIG_DIR"
$RELAYER_BINARY chains add --file $RELAYER_DIRECTORY/chains/"$CHAIN2".json --home "$RELAYER_CONFIG_DIR"

### Restore keys
$RELAYER_BINARY keys restore "$CHAIN1" "$KEY1" "alley afraid soup fall idea toss can goose become valve initial strong forward bright dish figure check leopard decide warfare hub unusual join cart" --home "$RELAYER_CONFIG_DIR"
$RELAYER_BINARY keys restore "$CHAIN2" "$KEY2" "record gift you once hip style during joke field prize dust unique length more pencil transfer quit train device arrive energy sort steak upset" --home "$RELAYER_CONFIG_DIR"

### Create a new path in config file
$RELAYER_BINARY paths new "$CHAIN1" "$CHAIN2" "$PATH_NAME" --home "$RELAYER_CONFIG_DIR"