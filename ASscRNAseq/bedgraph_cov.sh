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
#SBATCH --array=1-8

echo The array index is: "${SLURM_ARRAY_TASK_ID}"

module purge

cd $SCRATCH/allelespecific/samfiles

table=filelist.txt

line="$(head -n "${SLURM_ARRAY_TASK_ID}" "${table}" | tail -n 1)"
sample="$(printf "%s" "${line}" | cut -f1)"

module load bedtools/intel/2.27.1

bedtools genomecov -ibam ${sample} -bga > ${sample}bg.bed
