#!/bin/bash
#SBATCH --time=1-0
#SBATCH --mem=64G
#SBATCH -p pibu_el8
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=10
#SBATCH --job-name=OMARK

WORKDIR=/data/users/lwuetschert/assembly-annotation-course/omark_output
protein=/data/users/lwuetschert/assembly-annotation-course/final_annotation/ERR11437341.asm.bp.p_ctg.all.maker.proteins.fasta.renamed.filtered.fasta
OMArk="/data/courses/assembly-annotation-course/CDS_annotation/softwares/OMArk-0.3.0/"
ISOFORMS=/data/users/lwuetschert/assembly-annotation-course/omark_output/isoform_list.txt

cd $WORKDIR

wget https://omabrowser.org/All/LUCA.h5

omamer search --db  LUCA.h5 --query ${protein} --out ${protein}.omamer

omark -f ${protein}.omamer -of ${protein} -i $ISOFORMS -d LUCA.h5 -o omark_output_






wget https://omabrowser.org/All/LUCA.h5

omamer search --db LUCA.h5 --query ${protein}.renamed.fasta --out ${protein}.renamed.fasta.omamer