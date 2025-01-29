#!/usr/bin/env bash

#SBATCH --time=10:00:00
#SBATCH --mem=200G
#SBATCH --cpus-per-task=16
#SBATCH --job-name=quast_evaluation
#SBATCH --mail-user=Leo.Wuetschert@unifr.ch
#SBATCH --mail-type=end
#SBATCH --partition=pibu_el8

WORKDIR=/data/users/lwuetschert/assembly-annotation-course
ASSEMBLY_HIFIASM=/data/users/lwuetschert/assembly-annotation-course/assemblies/hifiasm/ERR11437341.asm.bp.p_ctg.fa
ASSEMBLY_FLYE=/data/users/lwuetschert/assembly-annotation-course/assemblies/flye/assembly.fasta
ASSEMBLY_LJA=/data/users/lwuetschert/assembly-annotation-course/assemblies/LJA/assembly.fasta
OUTPUT_DIR=/data/users/lwuetschert/assembly-annotation-course/QUAST
REF_FILE=/data/courses/assembly-annotation-course/references/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa
REF_FEATURE=/data/courses/assembly-annotation-course/references/TAIR10_GFF3_genes.gff


# with ref
#lja
apptainer exec --bind $WORKDIR /containers/apptainer/quast_5.2.0.sif\
 quast.py -o $OUTPUT_DIR/lja --labels St-0_LJA -r $REF_FILE --features $REF_FEATURE --threads 16 --eukaryote $ASSEMBLY_LJA

#flye
apptainer exec --bind $WORKDIR /containers/apptainer/quast_5.2.0.sif\
 quast.py -o $OUTPUT_DIR/flye --labels St-0_flye -r $REF_REF_FILE --features $REF_FEATURE --threads 16 --eukaryote $ASSEMBLY_FLYE

# without ref
#flye
apptainer exec --bind $WORKDIR /containers/apptainer/quast_5.2.0.sif\
 quast.py -o $OUTPUT_DIR/flye_noref --labels St-0_flye --threads 16 --eukaryote --est-ref-size 135000000 $ASSEMBLY_FLYE

#lja
apptainer exec --bind $WORKDIR /containers/apptainer/quast_5.2.0.sif\
 quast.py -o $OUTPUT_DIR/lja_noref --labels St-0_LJA  --threads 16 --eukaryote --est-ref-size 135000000 $ASSEMBLY_LJA