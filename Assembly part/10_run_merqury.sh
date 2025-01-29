#!/usr/bin/env bash

#SBATCH --time=1-00:00:00
#SBATCH --mem=64G
#SBATCH --cpus-per-task=32
#SBATCH --job-name=merqury
#SBATCH --mail-user=Leo.Wuetschert@unifr.ch
#SBATCH --mail-type=end
#SBATCH --partition=pibu_el8


WORKDIR=/data/users/lwuetschert/assembly-annotation-course
READS_FILE=/data/users/lwuetschert/assembly-annotation-course/St-0/ERR11437341.fastq.gz
OUTPUT_DIR=/data/users/lwuetschert/assembly-annotation-course/merqury/flye
MERYL=/data/users/lwuetschert/assembly-annotation-course/scripts/.meryl
ASSEMBLY_HIFIASM=/data/users/lwuetschert/assembly-annotation-course/assemblies/hifiasm/ERR11437341.asm.bp.p_ctg.fa
ASSEMBLY_FLYE=/data/users/lwuetschert/assembly-annotation-course/assemblies/flye/assembly.fasta
ASSEMBLY_LJA=/data/users/lwuetschert/assembly-annotation-course/assemblies/LJA/assembly.fasta
k=18.4864
export MERQURY="/usr/local/share/merqury"

cd /data/users/lwuetschert/assembly-annotation-course/merqury/flye

apptainer exec \
--bind $WORKDIR \
/containers/apptainer/merqury_1.3.sif \
merqury.sh $MERYL $ASSEMBLY_FLYE flye_eval

cd /data/users/lwuetschert/assembly-annotation-course/merqury/lja

apptainer exec \
--bind $WORKDIR \
/containers/apptainer/merqury_1.3.sif \
merqury.sh $MERYL $ASSEMBLY_LJA lja_eval
