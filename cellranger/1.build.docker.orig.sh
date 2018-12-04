#!/bin/bash

PATH_TO_DOCKERFILE=
YOUR_DOCKER_ID=

# build image
cd $PATH_TO_DOCKERFILE
# you might need to get a new token for the dockerfile from https://support.10xgenomics.com/single-cell-gene-expression/software/downloads/latest
docker build -t $YOUR_DOCKER_ID/cellranger:3.0.0 .

# push image to web repo (free docker account required)
docker push $YOUR_DOCKER_ID/cellranger:3.0.0
