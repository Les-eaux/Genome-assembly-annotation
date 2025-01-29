#!/usr/bin/env bash

#SBATCH --time=01:00:00
#SBATCH --mem=4G
#SBATCH --cpus-per-task=8
#SBATCH --job-name=clustalo
#SBATCH --mail-user=Leo.Wuetschert@unifr.ch
#SBATCH --mail-type=start,end
#SBATCH --partition=pibu_el8

OUTPUT_DIR=/data/users/lwuetschert/assembly-annotation-course/RT_prot_seq


module load Clustal-Omega/1.2.4-GCC-10.3.0

clustalo -i $OUTPUT_DIR/Copia_RT_all.fasta -o $OUTPUT_DIR/Copia_aligned.fasta

clustalo -i $OUTPUT_DIR/Gypsy_RT_all.fasta -o $OUTPUT_DIR/Gypsy_aligned.fasta