#!/usr/bin/env bash

#SBATCH --time=00:20:00
#SBATCH --mem=2G
#SBATCH --cpus-per-task=10
#SBATCH --job-name=Samtools_index
#SBATCH --mail-user=Leo.Wuetschert@unifr.ch
#SBATCH --mail-type=start,end
#SBATCH --partition=pibu_el8

ASSEMBLY=/data/users/lwuetschert/assembly-annotation-course/assemblies/hifiasm/ERR11437341.asm.bp.p_ctg.fa
INDEXDIR=/data/users/lwuetschert/assembly-annotation-course/samtools

module load SAMtools/1.13-GCC-10.3.0

cd $INDEXDIR

samtools faidx $ASSEMBLY