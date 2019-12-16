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

cd $SCRATCH/allelespecific/samfiles

table=SDlist.txt

sample1="$(head -n 1 "${table}" | tail -n 1)"
sample2="$(head -n 2 "${table}" | tail -n 1)"
sample3="$(head -n 3 "${table}" | tail -n 1)"
sample4="$(head -n 4 "${table}" | tail -n 1)"

module load macs2/intel/2.1.1  
 
macs2 callpeak -t ${sample1} ${sample2} ${sample3} ${sample4} -f BAM -g 12100000 --nomodel -q 0.001 --outdir $SCRATCH/allelespecific/peakoutput/SD -n SD1 --nolambda
