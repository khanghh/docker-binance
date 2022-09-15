#!/bin/bash
docker build -t bbc-node bbc-node/
docker build -t bsc-node bsc-node/
docker build -t bsc-relayer bsc-relayer/
docker build -t oracle-relayer oracle-relayer/
docker build -f blockscout/docker/Dockerfile -t blockscout blockscout/
