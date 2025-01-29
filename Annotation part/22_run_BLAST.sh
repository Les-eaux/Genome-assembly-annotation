#!/usr/bin/env bash

#SBATCH --time=1-10:00:00
#SBATCH --mem=10G
#SBATCH --cpus-per-task=10
#SBATCH --job-name=BLAST
#SBATCH --mail-user=Leo.Wuetschert@unifr.ch
#SBATCH --mail-type=start,end
#SBATCH --partition=pibu_el8

PROTEINS=/data/users/lwuetschert/assembly-annotation-course/final_annotation/ERR11437341.asm.bp.p_ctg.all.maker.proteins.fasta.renamed.filtered.fasta
OUTDIR=/data/users/lwuetschert/assembly-annotation-course/blastp_output

module load BLAST+/2.15.0-gompi-2021a

blastp -query $PROTEINS -db /data/courses/assembly-annotation-course/CDS_annotation/data/uniprot/uniprot_viridiplantae_reviewed.fa \
-num_threads 10 -outfmt 6 -evalue 1e-10 -out $OUTDIR/blastp_St-0