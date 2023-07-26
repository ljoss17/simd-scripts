# Force redundant issue

## Prerequisite

* The `simd` version you want to test installed locally and accessible by calling `simd`
* The Hermes version you want to test installed locally and located at `~/.hermes/bin/hermes`

## Setup

All the commands are called from the root of the repository:

1. Call `make init`
2. Create the channel with `hermes --config network/hermes/config.toml create channel --a-chain ibc1 --b-chain ibc2 --a-port transfer --b-port transfer --new-client-connection --yes`
3. Start the first Hermes instance: `hermes --config network/hermes/config.toml start`
4. Start the second Hermes instance: `hermes --config network/hermes/config2.toml start`

## Sending transactions

You can either manually send transactions with:

`hermes --config network/hermes/config.toml tx ft-transfer --dst-chain ibc2 --src-chain ibc1 --src-port transfer --src-channel channel-0 --amount 100 --timeout-seconds 120 --key-name wallet2 --denom stake`

Or use the `tx_per_min.sh` script which sends many TXs