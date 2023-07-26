for ITER in {1..100}
do
echo $ITER
~/.hermes/bin/hermes --config network/hermes/config.toml tx ft-transfer --dst-chain ibc2 --src-chain ibc1 --src-port transfer --src-channel channel-0 --amount 100 --timeout-seconds 120 --key-name wallet2 --denom stake
sleep 0.2
done
