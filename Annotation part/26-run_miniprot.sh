#!/bin/bash
#SBATCH --time=1-0
#SBATCH --mem=64G
#SBATCH -p pibu_el8
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=10
#SBATCH --job-name=MiniProt

ASSEMBLY=/data/users/lwuetschert/assembly-annotation-course/assemblies/hifiasm/ERR11437341.asm.bp.p_ctg.fa
MISSING=/data/users/lwuetschert/assembly-annotation-course/omark_output/omark_output_/missing_output.fa

./miniprot -I --gff --outs=0.95 $ASSEMBLY $MISSING > /data/users/lwuetschert/assembly-annotation-course/miniprot_output/missing.gff