#!/usr/bin/make -f

init: kill-dev
	@echo "Initializing both blockchains..."
	./network/init.sh
	./network/start.sh
	@echo "Initializing hermes relayer..."
	./network/hermes/restore-keys.sh
	./network/hermes/create-conn.sh

start: 
	@echo "Starting up test network"
	./network/start.sh

start-rly:
	./network/hermes/start.sh

kill-dev:
	@echo "Killing icad and removing previous data"
	-@rm -rf ./data
	-@rm -rf ./network/relayer/config/
	-@killall simd 2>/dev/null

init-go-relayer: kill-dev
	@echo "Initializing both blockchains..."
	./network/init.sh
	./network/start.sh
	@echo "Initializing go-relayer..."
	./network/relayer/setup-relayer.sh
	./network/relayer/create-path.sh

start-go-rly:
	./network/relayer/start.sh