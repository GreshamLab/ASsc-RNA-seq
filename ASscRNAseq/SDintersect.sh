#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --time=48:00:00
#SBATCH --mem=46GB
#SBATCH --job-name=alignment
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=<oa832@nyu.edu>


echo The array index is: "${SLURM_ARRAY_TASK_ID}"

module purge

module load bedtools/intel/2.27.1

cd $SCRATCH/allelespecific/samfiles

bedtools intersect -a SD_L001_sorted.bambg.bed -b SD_L002_sorted.bambg.bed > intermediate1.bed
bedtools intersect -a intermediate1.bed -b SD_L003_sorted.bambg.bed > intermediate2.bed
bedtools intersect -a intermediate2.bed -b SD_L004_sorted.bambg.bed > SDintersect.bed
