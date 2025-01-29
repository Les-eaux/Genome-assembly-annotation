#!/usr/bin/env bash

#SBATCH --time=01:00:00
#SBATCH --mem=10G
#SBATCH --cpus-per-task=8
#SBATCH --job-name=SeqKit
#SBATCH --mail-user=Leo.Wuetschert@unifr.ch
#SBATCH --mail-type=start,end
#SBATCH --partition=pibu_el8

FASTA_FILE=/data/users/lwuetschert/assembly-annotation-course/EDTA_annotation/ERR11437341.asm.bp.p_ctg.fa.mod.EDTA.TElib.fa
OUTDIR=/data/users/lwuetschert/assembly-annotation-course/results_TEsorter
WORKDIR=/data/users/lwuetschert/assembly-annotation-course/

module load SeqKit/2.6.1

cd $OUTDIR

# Extract Copia sequences
seqkit grep -r -p "Copia" $FASTA_FILE > Copia_sequences.fa
# Extract Gypsy sequences
seqkit grep -r -p "Gypsy" $FASTA_FILE > Gypsy_sequences.fa

apptainer exec --bind /data --writable-tmpfs -u /data/courses/assembly-annotation-course/CDS_annotation/containers/TEsorter_1.3.0.sif TEsorter Copia_sequences.fa -db rexdb-plant
apptainer exec --bind /data --writable-tmpfs -u /data/courses/assembly-annotation-course/CDS_annotation/containers/TEsorter_1.3.0.sif TEsorter Gypsy_sequences.fa -db rexdb-plant