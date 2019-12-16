#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --time=48:00:00
#SBATCH --mem=45GB
#SBATCH --job-name=alignment
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=<oa832@nyu.edu>

module load python3/intel/3.7.3


python3 fastq_parser.py
