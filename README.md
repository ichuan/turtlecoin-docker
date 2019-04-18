# turtlecoin-docker
Dockerfile for turtlecoin


# Building

```bash
docker build -t turtlecoin .
```

# Running

```bash
# block and wallet dir
mkdir data
# set rpc password to `asdf1234` (default: password)
docker run --rm -itd --name itrtl -e "rpc_passwd=asdf1234" -p 8070:8070 -v `pwd`/data:/opt/coin turtlecoin
```

# Using pre-built docker image

Using automated build image from <https://hub.docker.com/r/mixhq/turtlecoin/>:

```bash
docker run --rm -itd --name itrtl -p 8070:8070 -v `pwd`/data:/opt/coin  mixhq/turtlecoin
```

# Quick Sync
See <https://github.com/turtlecoin/checkpoints/>

1. Place `checkpoints.csv` in `data/data/` (blocks dir)
2. Start node
3. Remember to delete `checkpoints.csv` when sync done
