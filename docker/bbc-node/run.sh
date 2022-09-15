#!/bin/bash
NODE_DIR=${NODE_DIR:=$(pwd)}

[ -f "$NODE_DIR/.rc" ] && source "$NODE_DIR/.rc"

[ "$ADDRESS" != "" ] && RUN_OPTS="$RUN_OPTS --address=$ADDRESS"
[ "$MONIKER" != "" ] && RUN_OPTS="$RUN_OPTS --moniker=$MONIKER"

[ "$P2P_ADDRESS" != "" ] && RUN_OPTS="$RUN_OPTS --p2p.laddr=$P2P_ADDRESS"
[ "$P2P_PEERS" != "" ] && RUN_OPTS="$RUN_OPTS --p2p.persistent_peers=$P2P_PEERS"

[ "$RPC_ADDRESS" != "" ] && RUN_OPTS="$RUN_OPTS --rpc.laddr=$RPC_ADDRESS"

cp -r /keys/$MONIKER/* $NODE_DIR/.bnbchaind/config/

exec /usr/bin/bnbchaind start $RUN_OPTS
