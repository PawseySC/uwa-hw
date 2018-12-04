#!/bin/bash -l

#SBATCH --job-name=cr_orig
#SBATCH --account=pawsey0001
#SBATCH --partition=workq
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=28
#SBATCH --time=24:00:00
#SBATCH --mem=120G
#SBATCH --export=NONE 
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

DOCKER_ID=uwadt

module load shifter

srun --export=all shifter run \
	$DOCKER_ID/cellranger:3.0.0 \
	cellranger count --fastqs=$(pwd) \
	 --transcriptome=mm10 \
	--id=orig --sample=neuron_1k_v3 \
	--expect-cells=1000
