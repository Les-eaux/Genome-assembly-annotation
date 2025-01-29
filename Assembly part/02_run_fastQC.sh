#!/usr/bin/env bash

#SBATCH --cpus-per-task=4
#SBATCH --mem=20G
#SBATCH --time=01:00:00
#SBATCH --job-name=fastqc
#SBATCH --mail-user=Leo.Wuetschert@unifr.ch
#SBATCH --mail-type=end
#SBATCH --output=/data/users/lwuetschert/assembly-annotation-course/read_QC/output_fastqc_%j.o
#SBATCH --error=/data/users/lwuetschert/assembly-annotation-course/error_fastqc_%j.e
#SBATCH --partition=pibu_el8

READ_ACCESSION_DIR=/data/users/lwuetschert/assembly-annotation-course/St-0
READ_TRANSCRIPTOME_DIR=/data/users/lwuetschert/assembly-annotation-course/RNAseq_Sha
OUTPUT_DIR=/data/users/lwuetschert/assembly-annotation-course/read_QC

module load FastQC/0.11.9-Java-11

fastqc $READ_ACCESSION_DIR/*.fastq.gz -t 4 -o $OUTPUT_DIR
fastqc $READ_TRANSCRIPTOME_DIR/*.fastq.gz -t 4 -o $OUTPUT_DIR
