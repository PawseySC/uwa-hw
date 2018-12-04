#!/bin/bash -l

#SBATCH --job-name=cr_mod2
#SBATCH --account=pawsey0001
#SBATCH --partition=workq
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=28
#SBATCH --time=24:00:00
#SBATCH --mem=120G
#SBATCH --export=NONE 
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

MODIFIED_IMAGE=marcodelapierre/cr_test:mod2

module load shifter

srun --export=all shifter run \
	$MODIFIED_IMAGE \
	cellranger count --fastqs=$(pwd) \
	 --transcriptome=mm10 \
	--id=mod2 --sample=neuron_1k_v3 \
	--expect-cells=1000
