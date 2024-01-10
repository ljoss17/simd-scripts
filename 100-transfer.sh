#!/bin/bash
set -e

# Load shell variables
. ./network/hermes/variables.sh

for ITER in {1..100}
do
echo $ITER
$HERMES_BINARY --config network/hermes/config.toml tx ft-transfer --dst-chain ibc2 --src-chain ibc1 --src-port transfer --src-channel channel-0 --amount 100 --timeout-seconds 120000 --key-name wallet2 --denom stake
sleep 1
done
