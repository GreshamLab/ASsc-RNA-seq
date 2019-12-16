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

module load star/intel/2.7.3a


STAR --runThreadN 6 \
--runMode genomeGenerate \
--genomeSAindexNbases 10 \
--genomeDir $SCRATCH/allelespecific/reference \
--genomeFastaFiles $SCRATCH/allelespecific/reference/refwithutr.fasta \
--sjdbGTFfile $SCRATCH/allelespecific/Saccharomyces_cerevisiae.R64-1-1.UTR.gtf \
--sjdbOverhang 99

