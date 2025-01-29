#!/usr/bin/env bash

#SBATCH --time=01:00:00
#SBATCH --mem=10G
#SBATCH --cpus-per-task=8
#SBATCH --job-name=Perl
#SBATCH --mail-user=Leo.Wuetschert@unifr.ch
#SBATCH --mail-type=start,end
#SBATCH --partition=pibu_el8

INPUT_FILE=/data/users/lwuetschert/assembly-annotation-course/EDTA_annotation/ERR11437341.asm.bp.p_ctg.fa.mod.EDTA.anno/ERR11437341.asm.bp.p_ctg.fa.mod.out
OUTDIR=/data/users/lwuetschert/assembly-annotation-course/results_TEsorter
parseRM=/data/users/rchoudhury/assembly-annotation-course/scripts/04-parseRM.pl
WORKDIR=/data/users/lwuetschert/assembly-annotation-course/perl

cd $WORKDIR

module add BioPerl/1.7.8-GCCcore-10.3.0

perl $parseRM -i $INPUT_FILE -l 50,1 -v