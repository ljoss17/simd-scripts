# simd scripts

Boilerplate scripts for boostrapping simd nodes and relayer

### Installing simd

Install the `simd` binary from the [`ibc-go`](https://github.com/cosmos/ibc-go) repository.

```bash
git clone git@github.com:cosmos/ibc-go.git && cd ibc-go

make install
```

### Installing Hermes

```bash
cargo install ibc-relayer-cli --bin hermes --locked

hermes version # v1.6.0
```

### Setup chains

Bootsrap two `simd` chains. The following will clear any existing chain state under `./data` and create a new environment. 
It bootstraps two single validator nodes for different `simd` chains `test-1` and `test-2`.

The scripts create a couple of accounts, both for relayers and demo accounts.

```bash
make init
```

### Restore keys using Hermes

Restore keys for relayer wallets `rly-1` and `rly-2`.

```bash
make hermes-restore-keys
```

### Setting up IBC transport and relaying.

Create a connection from `test-1` to `test-2`. Note, this also creates ibc clients out of the box.

```bash
make hermes-setup-connection
```

Create an incentivized transfer channel.

```bash
make hermes-setup-channel
```

Start relaying.

```bash
make hermes-start
```

---

### Ledger signing 

Add your ledger key:

```bash
simd keys add ledgerKey --ledger --home ./data/test-1
```

Fund your ledger account from one of the demo accounts - `wallet1`:

```bash
simd tx bank send wallet1 cosmos1kzjk9frgfgpguvdazesgpllwsggk8472xryjvr 1000000stake --from wallet1 --node tcp://localhost:16657 --home ./data/test-1 --keyring-backend test
```

Query balance of ledger account:

```bash
simd q bank balances cosmos1kzjk9frgfgpguvdazesgpllwsggk8472xryjvr --home ./data/test-1 --node tcp://localhost:16657
```

Regular bank send using ledger signing:

```bash
simd tx bank send cosmos1kzjk9frgfgpguvdazesgpllwsggk8472xryjvr cosmos17dtl0mjt3t77kpuhg2edqzjpszulwhgzuj9ljs 10stake --from ledgerKey --ledger --node tcp://localhost:16657 --home ./data/test-1
```

IBC transfer using ledger signing:

```bash
simd tx ibc-transfer transfer transfer channel-0 cosmos17dtl0mjt3t77kpuhg2edqzjpszulwhgzuj9ljs 1000stake --from ledgerKey --ledger --node tcp://localhost:16657 --home ./data/test-1
```