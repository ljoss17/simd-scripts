#!/usr/bin/make -f

init-v8: kill-dev
	@echo "Initializing both blockchains..."
	./network/init_v8.sh
	./network/start_v8.sh
	@echo "Initializing hermes relayer..."
	./network/hermes/restore-keys.sh
	./network/hermes/create-conn.sh
	./network/hermes/create-chan.sh

init-v7: kill-dev
	@echo "Initializing both blockchains..."
	./network/init_v7.sh
	./network/start_v7.sh
	@echo "Initializing hermes relayer..."
	./network/hermes/restore-keys.sh
	./network/hermes/create-conn.sh
	./network/hermes/create-chan.sh

init-v7-v8: kill-dev
	@echo "Initializing both blockchains..."
	./network/init_v7_v8.sh
	./network/start_v7_v8.sh
	@echo "Initializing hermes relayer..."
	./network/hermes/restore-keys.sh
	./network/hermes/create-conn.sh
	./network/hermes/create-chan.sh

start-v7:
	@echo "Starting up test network"
	./network/start_v7.sh

start-v8:
	@echo "Starting up test network"
	./network/start_v8.sh

start-v7-v8:
	@echo "Starting up test network"
	./network/start_v7_v8.sh

hermes-profile:
	./100-transfer.sh
	sleep 5
	./network/hermes/profile.sh

kill-dev:
	@echo "Killing icad and removing previous data"
	-@rm -rf ./data
	-@rm -rf ./network/relayer/config/
	-@killall simd 2>/dev/null