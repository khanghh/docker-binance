#!/bin/bash
DATA_DIR=${DATA_DIR:=$(pwd)}
GETH=/usr/bin/geth

PUBLIC_IP=$(hostname -I | cut -f1 -d' ')
VERBOSITY=3

[ -f "$DATA_DIR/.rc" ] && source "$DATA_DIR/.rc"

if [ ! -f $DATA_DIR/geth ]; then
  echo $GETH init --datadir=$DATA_DIR $DATA_DIR/genesis.json
  $GETH init --datadir=$DATA_DIR $DATA_DIR/genesis.json
fi

CMD="$GETH --config=$DATA_DIR/config.toml \
  --datadir=$DATA_DIR \
  --nodekeyhex=${NODE_KEY} \
  --nodiscover \
  --nat="extip:${PUBLIC_IP}" \
  --cache=4096 \
  --verbosity=$VERBOSITY \
  --metrics \
  --metrics.expensive \
  --metrics.addr=0.0.0.0 \
  --metrics.port=6060 \
  --mine \
  --miner.threads=1 \
  --miner.gasprice=0 \
  --miner.etherbase=$UNLOCK_ACCOUNT \
  --unlock=$UNLOCK_ACCOUNT \
  --password=/dev/null"

echo $CMD
exec $CMD
