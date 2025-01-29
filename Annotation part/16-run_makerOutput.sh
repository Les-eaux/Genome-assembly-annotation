#!/usr/bin/env bash

#SBATCH --time=01:00:00
#SBATCH --mem=10G
#SBATCH --cpus-per-task=12
#SBATCH --job-name=maker_output
#SBATCH --mail-user=Leo.Wuetschert@unifr.ch
#SBATCH --mail-type=start,end
#SBATCH --partition=pibu_el8

COURSEDIR=/data/courses/assembly-annotation-course/CDS_annotation/
WORKDIR=/data/users/lwuetschert/assembly-annotation-course/gene_annotation/



MAKERBIN="$COURSEDIR/softwares/Maker_v3.01.03/src/bin"

cd $WORKDIR

$MAKERBIN/gff3_merge -s -d ERR11437341.asm.bp.p_ctg.maker.output/ERR11437341.asm.bp.p_ctg_master_datastore_index.log > ERR11437341.asm.bp.p_ctg.all.maker.gff

$MAKERBIN/gff3_merge -n -s -d ERR11437341.asm.bp.p_ctg.maker.output/ERR11437341.asm.bp.p_ctg_master_datastore_index.log > ERR11437341.asm.bp.p_ctg.all.maker.noseq.gff

$MAKERBIN/fasta_merge -d ERR11437341.asm.bp.p_ctg.maker.output/ERR11437341.asm.bp.p_ctg_master_datastore_index.log -o ERR11437341.asm.bp.p_ctg