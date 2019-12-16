#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --time=48:00:00
#SBATCH --mem=2GB
#SBATCH --job-name=alignment
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=<oa832@nyu.edu>
#SBATCH --array=1-4

echo The array index is: "${SLURM_ARRAY_TASK_ID}"

cd samfiles

module purge

table=$SCRATCH/allelespecific/rawdata/filelist2.txt

sample="$(head -n "${SLURM_ARRAY_TASK_ID}" "${table}" | tail -n 1)"
module load star/intel/2.7.3a

STAR --genomeDir $SCRATCH/allelespecific/reference \
--runThreadN 6 \
--readFilesIn <(zcat $SCRATCH/allelespecific/rawdata/YPD_POCPOOL/${sample}) \
--outFileNamePrefix "${sample}" \
--outSAMtype SAM \
--outSAMunmapped Within \
--outSAMattributes Standard 
