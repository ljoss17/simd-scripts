#!/bin/bash

BINARY1=/Users/luca/go/bin/simdv7
BINARY2=/Users/luca/go/bin/simdv8
CHAIN_DIR=./data
CHAINID_1=ibc1
CHAINID_2=ibc2
GRPCPORT_1=8090
GRPCPORT_2=9090
GRPCWEB_1=8091
GRPCWEB_2=9091


echo "Starting $CHAINID_1 in $CHAIN_DIR..."
echo "Creating log file at $CHAIN_DIR/$CHAINID_1.log"
$BINARY1 start --log_level debug --log_format json --home $CHAIN_DIR/$CHAINID_1 --pruning=nothing --grpc.address="0.0.0.0:$GRPCPORT_1" --grpc-web.address="0.0.0.0:$GRPCWEB_1" > $CHAIN_DIR/$CHAINID_1.log 2>&1 &

echo "Starting $CHAINID_2 in $CHAIN_DIR..."
echo "Creating log file at $CHAIN_DIR/$CHAINID_2.log"
$BINARY2 start --log_level debug --log_format json --home $CHAIN_DIR/$CHAINID_2 --pruning=nothing --grpc.address="0.0.0.0:$GRPCPORT_2" > $CHAIN_DIR/$CHAINID_2.log 2>&1 &
