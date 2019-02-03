#!/bin/bash

JSONRPC_PORT=${JSONRPC_PORT:-'8545'}
WEBSOCKETS_PORT=${WEBSOCKETS_PORT:-'8546'}
NETWORK_PORT=${NETWORK_PORT:-'30311'}

/bin/parity --config /etc/mintnet/mintnet.toml \
    --jsonrpc-port=$JSONRPC_PORT \
    --port=$NETWORK_PORT \
    --ws-port=$WEBSOCKETS_PORT \
    --gasprice 0 \
    --jsonrpc-cors all \
    --ws-origins all \
    --unsafe-expose \
      daemon 1234

sleep 10s

# Import the authority account from the passphrase
curl --data "{\"jsonrpc\":\"2.0\",\"method\":\"personal_newAccount\",\"params\":[\"mintnet\"],\"id\":0}" -H "Content-Type: application/json" -X POST 127.0.0.1:8545

kill $(ps ax | grep parity | grep -v grep | awk '{ print $1 }');

sleep 5s

/bin/parity --config /etc/mintnet/mintnet.toml \
    --jsonrpc-port=$JSONRPC_PORT \
    --port=$NETWORK_PORT \
    --ws-port=$WEBSOCKETS_PORT \
    --gasprice 0 \
    --jsonrpc-cors all \
    --ws-origins all \
    --unsafe-expose
