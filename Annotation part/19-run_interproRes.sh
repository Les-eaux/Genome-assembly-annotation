#!/usr/bin/env bash

#SBATCH --time=01:00:00
#SBATCH --mem=25G
#SBATCH --cpus-per-task=10
#SBATCH --job-name=interproscan_res
#SBATCH --mail-user=Leo.Wuetschert@unifr.ch
#SBATCH --mail-type=start,end
#SBATCH --partition=pibu_el8

COURSEDIR=/data/courses/assembly-annotation-course/CDS_annotation/
WORKDIR=/data/users/lwuetschert/assembly-annotation-course/
FINAL=/data/users/lwuetschert/assembly-annotation-course/final_annotation
MAKERBIN="$COURSEDIR/softwares/Maker_v3.01.03/src/bin"

gff="ERR11437341.asm.bp.p_ctg.all.maker.noseq.gff"

cd $FINAL

$MAKERBIN/ipr_update_gff ${gff}.renamed.gff output.iprscan > ${gff}.renamed.iprscan.gff