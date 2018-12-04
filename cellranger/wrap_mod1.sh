#!/bin/bash

cp reference_3.0.0_mod1.py /apps/cellranger-3.0.0/cellranger-cs/3.0.0/lib/python/cellranger/reference.py

cellranger count --fastqs=$(pwd) \
	 --transcriptome=mm10 \
	--id=mod1 --sample=neuron_1k_v3 \
	--expect-cells=1000
