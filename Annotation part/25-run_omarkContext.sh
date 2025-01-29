#!/bin/bash
#SBATCH --time=1-0
#SBATCH --mem=64G
#SBATCH -p pibu_el8
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=10
#SBATCH --job-name=OMARK_context

COURSEDIR="/data/courses/assembly-annotation-course/CDS_annotation"
OMAMEROUT=/data/users/lwuetschert/assembly-annotation-course/final_annotation/ERR11437341.asm.bp.p_ctg.all.maker.proteins.fasta.renamed.filtered.fasta.omamer
OUTDIR=/data/users/lwuetschert/assembly-annotation-course/omark_output/omark_output_

# Download the Orthologs of fragmented and missing genes from OMArk database

$COURSEDIR/softwares/OMArk-0.3.0/utils/omark_contextualize.py fragment -m $OMAMEROUT -o $OUTDIR -f fragment_HOGs
$COURSEDIR/softwares/OMArk-0.3.0/utils/omark_contextualize.py missing -m $OMAMEROUT -o $OUTDIR