#!/usr/bin/env bash

#SBATCH --time=1-00:00:00
#SBATCH --mem=100G
#SBATCH --cpus-per-task=32
#SBATCH --job-name=MUMmer
#SBATCH --mail-user=Leo.Wuetschert@unifr.ch
#SBATCH --mail-type=end
#SBATCH --partition=pibu_el8

WORKDIR=/data/users/lwuetschert/assembly-annotation-course
ASSEMBLY_HIFIASM=/data/users/lwuetschert/assembly-annotation-course/assemblies/hifiasm/ERR11437341.asm.bp.p_ctg.fa
ASSEMBLY_FLYE=/data/users/lwuetschert/assembly-annotation-course/assemblies/flye/assembly.fasta
ASSEMBLY_LJA=/data/users/lwuetschert/assembly-annotation-course/assemblies/LJA/assembly.fasta
OUTPUT_DIR=/data/users/lwuetschert/assembly-annotation-course/MUMmer
REF_FILE=/data/courses/assembly-annotation-course/references/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa

apptainer exec \
--bind $WORKDIR \
/containers/apptainer/mummer4_gnuplot.sif \
nucmer --breaklen 1000 --mincluster 1000 -p $OUTPUT_DIR/lja/lja_mummer -t 32 $REF_FILE $ASSEMBLY_LJA

apptainer exec \
--bind $WORKDIR \
/containers/apptainer/mummer4_gnuplot.sif \
nucmer --breaklen 1000 --mincluster 1000 -p $OUTPUT_DIR/flye/flye_mummer -t 32 $REF_FILE $ASSEMBLY_FLYE
