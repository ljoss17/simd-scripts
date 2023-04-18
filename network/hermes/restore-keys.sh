#!/bin/bash
set -e

# Load shell variables
. ./network/hermes/variables.sh

### Sleep is needed otherwise the relayer crashes when trying to init
sleep 1

### Restore Keys for chain test-1
$HERMES_BINARY --config ./network/hermes/config.toml keys add --chain test-1 --mnemonic-file network/hermes/relayer1_mnemonic
sleep 5
$HERMES_BINARY --config ./network/hermes/config.toml keys add --chain test-1 --mnemonic-file network/hermes/wallet1_mnemonic --key-name wallet1
sleep 5
$HERMES_BINARY --config ./network/hermes/config.toml keys add --chain test-1 --mnemonic-file network/hermes/wallet2_mnemonic --key-name wallet2
sleep 5

### Restore Keys for chain test-2
$HERMES_BINARY --config ./network/hermes/config.toml keys add --chain test-2 --mnemonic-file network/hermes/relayer2_mnemonic
sleep 5
$HERMES_BINARY --config ./network/hermes/config.toml keys add --chain test-2 --mnemonic-file network/hermes/wallet3_mnemonic --key-name wallet3
sleep 5
