#!/bin/bash

PATH_TO_DOCKERFILE=
CONTAINER_ID=uwadt/shiny_seurat:3.5.1_2.3.4

# build image
cd $PATH_TO_DOCKERFILE
docker build -t $CONTAINER_ID .

# push image to web repo (free docker account required)
docker push $CONTAINER_ID
