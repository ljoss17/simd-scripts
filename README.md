# simd scripts

Boilerplate scripts for boostrapping simd nodes and relayer

### Installing simd

Install the `simd` binary from the [`ibc-go`](https://github.com/cosmos/ibc-go) repository.

```bash
git clone git@github.com:cosmos/ibc-go.git && cd ibc-go

make install
```

# Hermes

Update the variables in `variables.sh` as needed

## Profiling with Hermes

### Setup

Change the environment variables `BINARY1` and `BINARY2` in the required files:

* `network/init_v7.sh`
* `network/init_v8.sh`
* `network/init_v7_v8.sh`
* `network/start_v7.sh`
* `network/start_v8.sh`
* `network/start_v7_v8.sh`

Check that the `make kill-dev` correctly kills the simd binary.

For simd v7 run:

* `make init-v7`
* `make start-v7`
* `make hermes-profile`

For simd v8 run:

* `make init-v7`
* `make start-v7`
* `make hermes-profile`

For simd v7 to v8 run:

* `make init-v7-v8`
* `make start-v7-v8`
* `make hermes-profile`