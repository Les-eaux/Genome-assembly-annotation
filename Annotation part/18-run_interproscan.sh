#!/usr/bin/env bash

#SBATCH --time=01:00:00
#SBATCH --mem=25G
#SBATCH --cpus-per-task=16
#SBATCH --job-name=interproscan
#SBATCH --mail-user=Leo.Wuetschert@unifr.ch
#SBATCH --mail-type=start,end
#SBATCH --partition=pibu_el8

COURSEDIR=/data/courses/assembly-annotation-course/CDS_annotation/
WORKDIR=/data/users/lwuetschert/assembly-annotation-course/
FINAL=/data/users/lwuetschert/assembly-annotation-course/final_annotation
MAKERBIN="$COURSEDIR/softwares/Maker_v3.01.03/src/bin"

protein="ERR11437341.asm.bp.p_ctg.all.maker.proteins.fasta"

cd $FINAL

apptainer exec \
--bind $COURSEDIR/data/interproscan-5.70-102.0/data:/opt/interproscan/data \
--bind $WORKDIR \
--bind $COURSEDIR \
--bind $SCRATCH:/temp \
$COURSEDIR/containers/interproscan_latest.sif \
/opt/interproscan/interproscan.sh \
-appl pfam --disable-precalc -f TSV \
--goterms --iprlookup --seqtype p \
-i ${protein}.renamed.fasta -o output.iprscan