#!/bin/bash -l

#SBATCH --job-name=cr_my_test2
#SBATCH --account=pawsey0012
#SBATCH --partition=highmemq
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=16
#SBATCH --time=24:00:00
#SBATCH --mem=120G
#SBATCH --export=NONE 
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

export PATH=/group/pawsey0001/mdelapierre/users/dave_tang_cellranger/3.0.2/cellranger-cs/3.0.2/bin:$PATH

srun --export=all \
	cellranger count --fastqs=$(pwd) \
	 --transcriptome=mm10 \
	--id=my_test2 --sample=neuron_1k_v3 \
	--expect-cells=1000 \
    --alignIntronMin 22 \
    --alignIntronMax 900000 \
    --scoreDelOpen -1 \
    --scoreDelBase -1 \
    --scoreInsOpen -1 \
    --scoreInsBase -1

