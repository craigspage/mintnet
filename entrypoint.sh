#!/bin/bash

JSONRPC_PORT=${JSONRPC_PORT:-'8545'}
WEBSOCKETS_PORT=${WEBSOCKETS_PORT:-'8546'}
NETWORK_PORT=${NETWORK_PORT:-'30311'}

/parity/parity --config /etc/mintnet/mintnet.toml \
    --jsonrpc-port=$JSONRPC_PORT \
    --port=$NETWORK_PORT \
    --ws-port=$WEBSOCKETS_PORT \
    --gasprice 0 \
    --jsonrpc-cors all \
    --ws-origins all \
    --port=$NETWORK_PORT \
    --ws-port=$WEBSOCKETS_PORT \
    --unsafe-expose