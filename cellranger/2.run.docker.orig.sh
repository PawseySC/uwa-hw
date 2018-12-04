#!/bin/bash

# assuming uwadt docker image here
DOCKER_ID=uwadt

# pull (1st time only, if not already in machine)
docker pull $DOCKER_ID/cellranger:3.0.0

# run cellranger, assuming directory structure as in "dirstruc-example" file
cd test1
docker run --rm \
	-v $(pwd)/..:/data -w /data/$(basename $(pwd)) \
	$DOCKER_ID/cellranger:3.0.0 \
	cellranger count --fastqs=$(pwd) \
	--transcriptome=mm10 \
	--id=orig --sample=neuron_1k_v3 \
	--expect-cells=1000
