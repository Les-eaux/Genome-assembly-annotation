#!/usr/bin/env bash

#SBATCH --time=1-00:00:00
#SBATCH --mem=64G
#SBATCH --cpus-per-task=16
#SBATCH --job-name=transcriptome_assembly
#SBATCH --mail-user=Leo.Wuetschert@unifr.ch
#SBATCH --mail-type=end
#SBATCH --partition=pibu_el8

WORKDIR=/data/users/lwuetschert/assembly-annotation-course
READS_DIR=/data/users/lwuetschert/assembly-annotation-course/fastp
OUTPUT_DIR=/data/users/lwuetschert/assembly-annotation-course/trinity_output

module load Trinity/2.15.1-foss-2021a

Trinity --seqType fq --max_memory 64G --left $READS_DIR/RNAseq_trimmed_1.fastq.gz --right $READS_DIR/RNAseq_trimmed_2.fastq.gz --CPU 16 --output $OUTPUT_DIR 