# Binance docker

Docker deployments of binance blockchain

## Deployments

![Binance blockchain architecture](https://lh3.googleusercontent.com/0JqykN-TYAyuwML_9bMphW7UWKDX4mN4CjM-K-CL7tiyrM38ceDVdlZrDLKFnWeaiWlYqnEhRrcHsoRnvJwn_A9BauXWlESLwy0njHFh64Za_PrdaEI-CQzJ5IHEHMJqI0f_Bp3h)

### Build docker images

Go to the `docker` directory and execute the following commands:

```bash
docker build -t bbc-node bbc-node/
docker build -t bsc-node bsc-node/
docker build -t bsc-relayer bsc-relayer/
docker build -t oracle-relayer oracle-relayer/
```

Build [blockscout](https://github.com/blockscout/blockscout) block explorer docker image:

```bash
git clone https://github.com/blockscout/blockscout.git
docker build -f blockscout/docker/Dockerfile -t blockscout blockscout/
```

### Deploy containers

Run the following commands under the `deployments` directory

- Deploy Binance Beacon Chain

```bash
docker compose up -f beacon-chain.yml -d
```

- Deploy Binance Smart Chain

```bash
docker compose up -f bsc-chain.yml -d
```

- Deploy `bsc-relayer` and `oracle-relayer`

```bash
docker compose up -f bsc-chain.yml -d
```

- Deploy block explorer and database management tool:

```bash
docker compose up -f tools.yml -d
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.
