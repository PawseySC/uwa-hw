#!/bin/bash

DOCKER_ID=uwadt

# 1st time only: patch original cellranger sourcefile (assuming you have it available)
patch -o reference_3.0.0_mod1.py reference_3.0.0_orig.py reference_3.0.0_mod1.patch

docker run --rm \
	-v $(pwd)/..:/data -w /data/$(basename $(pwd)) \
	$DOCKER_ID/cellranger:3.0.0 \
	bash wrap_mod1.sh
