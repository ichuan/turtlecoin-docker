#!/usr/bin/env bash

set -e
rpc_passwd=${rpc_passwd:-password}
wallet_file=/opt/coin/wallet/container
service_args="--bind-address 0.0.0.0 --bind-port 8070 --rpc-password $rpc_passwd --log-file /opt/coin/wallet/service.log --container-file $wallet_file"
node_args="--data-dir /opt/coin/data/ --log-file /opt/coin/data/TurtleCoind.log --no-console --hide-my-port"

mkdir -p /opt/coin/{data,wallet}

if test $# -eq 0; then
  # generate wallet if needed
  [ ! -f $wallet_file ] && {
    /opt/turtle-service $service_args --generate-container
    echo "Generated wallet file at $wallet_file"
  }
  # start node
  [ -f /opt/coin/data/checkpoints.csv ] && {
    node_args="$node_args --load-checkpoints /opt/coin/data/checkpoints.csv"
  }
  /opt/TurtleCoind $node_args &
  # wallet api
  exec /opt/turtle-service $service_args
else
  exec $@
fi
