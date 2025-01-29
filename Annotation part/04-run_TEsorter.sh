#!/usr/bin/env bash

#SBATCH --time=01:00:00
#SBATCH --mem=10G
#SBATCH --cpus-per-task=8
#SBATCH --job-name=TEsorter
#SBATCH --mail-user=Leo.Wuetschert@unifr.ch
#SBATCH --mail-type=start,end
#SBATCH --partition=pibu_el8

FASTA_FILE=/data/users/lwuetschert/assembly-annotation-course/EDTA_annotation/ERR11437341.asm.bp.p_ctg.fa.mod.EDTA.raw/LTR/ERR11437341.asm.bp.p_ctg.fa.mod.LTR.intact.fa
OUTDIR=/data/users/lwuetschert/assembly-annotation-course/results_TEsorter
WORKDIR=/data/users/lwuetschert/assembly-annotation-course/

cd $OUTDIR

apptainer exec --bind /data --writable-tmpfs -u /data/courses/assembly-annotation-course/CDS_annotation/containers/TEsorter_1.3.0.sif TEsorter $FASTA_FILE -db rexdb-plant
