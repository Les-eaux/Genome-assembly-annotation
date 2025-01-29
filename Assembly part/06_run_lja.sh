#!/usr/bin/env bash

#SBATCH --time=3-00:00:00
#SBATCH --mem=250G
#SBATCH --cpus-per-task=64
#SBATCH --job-name=lja_assembly
#SBATCH --mail-user=Leo.Wuetschert@unifr.ch
#SBATCH --mail-type=end
#SBATCH --partition=pibu_el8

WORKDIR=/data/users/lwuetschert/assembly-annotation-course
READS_FILE=/data/users/lwuetschert/assembly-annotation-course/St-0/ERR11437341.fastq.gz
OUTPUT_DIR=/data/users/lwuetschert/assembly-annotation-course/assemblies/LJA

apptainer exec \
--bind $WORKDIR \
/containers/apptainer/lja-0.2.sif \
lja \
-o $OUTPUT_DIR \
--reads $READS_FILE \
--diploid \
-t 64
