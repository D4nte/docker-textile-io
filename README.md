
## Use at your own risk

The retrieval/backup of seeds is not as straightforward with docker so use at your own risk.

Better to use if you know what you are doing but too lazy to create your own docker image.

Contributions welcome.

## Motivation

I aim to run [Easy Personal IPFS Pinning Service With Textile](https://medium.com/textileio/easy-personal-ipfs-pinning-service-with-textile-9d366da4e420) on my synology nas and hence need a docker image.

# Local image build

1. `git clone git@github.com:D4nte/docker-textile-io.git`
2. `cd docker-textile-io` 
3. `docker build . -t textile`

# Dockerhub

`docker pull royerfranck/textile-io:latest`

# Run

1. First time: `docker run -it textile`. Be sure to save your mnemonic and seed
2. Following times: `docker run textile --seed <your seed>`

Feel free at anytime to pass arguments.
These arguments will be used for the `textile init` step.

Example:
```
docker run textile --seed $SEED \
    --server --cafe-open --swarm-ports=4001 \
    --cafe-http-url="$URL" \
    --cafe-public-ip="$IP" \
    --cafe-bind-addr=0.0.0.0:40601 \
    --gateway-bind-addr=0.0.0.0:5050 
```
