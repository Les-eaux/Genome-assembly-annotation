#!/usr/bin/env bash

#SBATCH --cpus-per-task=1
#SBATCH --mem=50G
#SBATCH --time=01:00:00
#SBATCH --job-name=fastp
#SBATCH --mail-user=Leo.Wuetschert@unifr.ch
#SBATCH --mail-type=end
#SBATCH --partition=pibu_el8

READ_ACCESSION_DIR=/data/users/lwuetschert/assembly-annotation-course/St-0
READ_TRANSCRIPTOME_DIR=/data/users/lwuetschert/assembly-annotation-course/RNAseq_Sha
LOGS_DIR=/data/users/lwuetschert/assembly-annotation-course/logs
OUTPUT_DIR=/data/users/lwuetschert/assembly-annotation-course/fastp

module load fastp/0.23.4-GCC-10.3.0

{ fastp -i $READ_TRANSCRIPTOME_DIR/ERR754081_1.fastq.gz -o $OUTPUT_DIR/RNAseq_trimmed_1.fastq.gz -I $READ_TRANSCRIPTOME_DIR/ERR754081_2.fastq.gz -O $OUTPUT_DIR/RNAseq_trimmed_2.fastq.gz -h RNAseq_fastp.html; } > $LOGS_DIR/log_fastp_transcriptome.txt 2>&1 
{ fastp -i $READ_ACCESSION_DIR/ERR11437341.fastq.gz -o $OUTPUT_DIR/St-0_trimmed.fastq.gz -L -h St-0_fastp.html; } > $LOGS_DIR/log_fastp_st-0.txt 2>&1 