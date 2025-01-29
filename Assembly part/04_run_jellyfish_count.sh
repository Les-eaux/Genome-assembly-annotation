#!/usr/bin/env bash

#SBATCH --cpus-per-task=8
#SBATCH --mem=100G
#SBATCH --time=03:00:00
#SBATCH --job-name=jellyfish_count
#SBATCH --mail-user=Leo.Wuetschert@unifr.ch
#SBATCH --mail-type=end
#SBATCH --partition=pibu_el8

FASTQ_FILE=/data/users/lwuetschert/assembly-annotation-course/fastp/St-0_trimmed.fastq.gz
LOGS_DIR=/data/users/lwuetschert/assembly-annotation-course/logs
OUTPUT_DIR=/data/users/lwuetschert/assembly-annotation-course/jellyfish

module load Jellyfish/2.3.0-GCC-10.3.0 

jellyfish count -C -m 21 -s 5G -t 4 -o $OUTPUT_DIR/St-0.jf <(zcat $FASTQ_FILE)
