#!/usr/bin/env bash

#SBATCH --time=1-00:00:00
#SBATCH --mem=100G
#SBATCH --cpus-per-task=32
#SBATCH --job-name=busco_evaluation
#SBATCH --mail-user=Leo.Wuetschert@unifr.ch
#SBATCH --mail-type=end
#SBATCH --partition=pibu_el8

ASSEMBLY_FLYE=/data/users/lwuetschert/assembly-annotation-course/assemblies/flye/assembly.fasta
ASSEMBLY_LJA=/data/users/lwuetschert/assembly-annotation-course/assemblies/LJA/assembly.fasta
OUTPUT_DIR=/data/users/lwuetschert/assembly-annotation-course/BUSCO

module load BUSCO/5.4.2-foss-2021a

busco \
--in $ASSEMBLY_FLYE \
--out_path $OUTPUT_DIR \
--out busco_flye \
--mode genome \
-l brassicales_odb10 \
--cpu 32

busco \
--in $ASSEMBLY_LJA \
--out_path $OUTPUT_DIR \
--out busco_lja \
--mode genome \
-l brassicales_odb10 \
--cpu 32