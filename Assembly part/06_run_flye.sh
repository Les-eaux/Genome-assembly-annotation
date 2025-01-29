#!/usr/bin/env bash

#SBATCH --time=1-00:00:00
#SBATCH --mem=64G
#SBATCH --cpus-per-task=32
#SBATCH --job-name=flye_assembly
#SBATCH --mail-user=Leo.Wuetschert@unifr.ch
#SBATCH --mail-type=end
#SBATCH --partition=pibu_el8

WORKDIR=/data/users/lwuetschert/assembly-annotation-course
READS_FILE=/data/users/lwuetschert/assembly-annotation-course/St-0/ERR11437341.fastq.gz
OUTPUT_DIR=/data/users/lwuetschert/assembly-annotation-course/assemblies/flye

apptainer exec \
--bind $WORKDIR \
/containers/apptainer/flye_2.9.5.sif \
flye \
--pacbio-hifi $READS_FILE \
--out-dir $OUTPUT_DIR \
--threads 32





