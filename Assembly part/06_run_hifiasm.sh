#!/usr/bin/env bash

#SBATCH --time=1-00:00:00
#SBATCH --mem=64G
#SBATCH --cpus-per-task=16
#SBATCH --job-name=hifiasm_assembly
#SBATCH --mail-user=Leo.Wuetschert@unifr.ch
#SBATCH --mail-type=end
#SBATCH --partition=pibu_el8

WORKDIR=/data/users/lwuetschert/assembly-annotation-course
READS_FILE=/data/users/lwuetschert/assembly-annotation-course/St-0/ERR11437341.fastq.gz
OUTPUT_DIR=/data/users/lwuetschert/assembly-annotation-course/assemblies

apptainer exec \
--bind $WORKDIR \
/containers/apptainer/hifiasm_0.19.8.sif \
hifiasm \
-o $OUTPUT_DIR/ERR11437341.asm \
-t 16 \
$READS_FILE
