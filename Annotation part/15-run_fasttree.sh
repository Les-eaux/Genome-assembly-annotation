#!/usr/bin/env bash

#SBATCH --time=01:00:00
#SBATCH --mem=4G
#SBATCH --cpus-per-task=4
#SBATCH --job-name=FastTree
#SBATCH --mail-user=Leo.Wuetschert@unifr.ch
#SBATCH --mail-type=start,end
#SBATCH --partition=pibu_el8

OUTDIR=/data/users/lwuetschert/assembly-annotation-course/RT_prot_seq/
COPIA=/data/users/lwuetschert/assembly-annotation-course/RT_prot_seq/Copia_aligned.fasta
GYPSY=/data/users/lwuetschert/assembly-annotation-course/RT_prot_seq/Gypsy_aligned.fasta

module load FastTree/2.1.11-GCCcore-10.3.0

FastTree -out $OUTDIR/Copia_tree $COPIA

FastTree -out $OUTDIR/Gypsy_tree $GYPSY
