#!/usr/bin/env bash

#SBATCH --time=00:30:00
#SBATCH --mem=20G
#SBATCH --cpus-per-task=8
#SBATCH --job-name=MUMmer_plot
#SBATCH --mail-user=Leo.Wuetschert@unifr.ch
#SBATCH --mail-type=end
#SBATCH --partition=pibu_el8

WORKDIR=/data/users/lwuetschert/assembly-annotation-course
DELTA_FLYE=/data/users/lwuetschert/assembly-annotation-course/MUMmer/flye/flye_mummer.delta
DELTA_HIFIASM=/data/users/lwuetschert/assembly-annotation-course/MUMmer/hifiasm/hifiasm_mummer.delta
DELTA_LJA=/data/users/lwuetschert/assembly-annotation-course/MUMmer/lja/lja_mummer.delta
ASSEMBLY_HIFIASM=/data/users/lwuetschert/assembly-annotation-course/assemblies/hifiasm/ERR11437341.asm.bp.p_ctg.fa
ASSEMBLY_FLYE=/data/users/lwuetschert/assembly-annotation-course/assemblies/flye/assembly.fasta
ASSEMBLY_LJA=/data/users/lwuetschert/assembly-annotation-course/assemblies/LJA/assembly.fasta
OUTPUT_DIR=/data/users/lwuetschert/assembly-annotation-course/MUMmer/plots
REF_FILE=/data/courses/assembly-annotation-course/references/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa



apptainer exec \
--bind $WORKDIR \
/containers/apptainer/mummer4_gnuplot.sif \
mummerplot -R $REF_FILE -Q $ASSEMBLY_HIFIASM --filter -t png --large --layout --fat -p $OUTPUT_DIR/hifiasm $DELTA_HIFIASM

apptainer exec \
--bind $WORKDIR \
/containers/apptainer/mummer4_gnuplot.sif \
mummerplot -R $REF_FILE -Q $ASSEMBLY_FLYE --filter -t png --large --layout --fat -p $OUTPUT_DIR/flye $DELTA_FLYE

apptainer exec \
--bind $WORKDIR \
/containers/apptainer/mummer4_gnuplot.sif \
mummerplot -R $REF_FILE -Q $ASSEMBLY_LJA --filter -t png --large --layout --fat -p $OUTPUT_DIR/lja $DELTA_LJA