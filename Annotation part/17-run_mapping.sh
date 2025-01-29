#!/usr/bin/env bash

#SBATCH --time=01:00:00
#SBATCH --mem=10G
#SBATCH --cpus-per-task=12
#SBATCH --job-name=mapping
#SBATCH --mail-user=Leo.Wuetschert@unifr.ch
#SBATCH --mail-type=start,end
#SBATCH --partition=pibu_el8

COURSEDIR=/data/courses/assembly-annotation-course/CDS_annotation/
WORKDIR=/data/users/lwuetschert/assembly-annotation-course/gene_annotation/
FINAL=/data/users/lwuetschert/assembly-annotation-course/final_annotation
MAKERBIN="$COURSEDIR/softwares/Maker_v3.01.03/src/bin"
prefix=St-0

cd $WORKDIR

protein="ERR11437341.asm.bp.p_ctg.all.maker.proteins.fasta"
transcript="ERR11437341.asm.bp.p_ctg.all.maker.transcripts.fasta"
gff="ERR11437341.asm.bp.p_ctg.all.maker.noseq.gff"

cp $gff $FINAL/${gff}.renamed.gff
cp $protein $FINAL/${protein}.renamed.fasta
cp $transcript $FINAL/${transcript}.renamed.fasta

cd $FINAL

$MAKERBIN/maker_map_ids --prefix $prefix --justify 7 ${gff}.renamed.gff > id.map
$MAKERBIN/map_gff_ids id.map ${gff}.renamed.gff
$MAKERBIN/map_fasta_ids id.map ${protein}.renamed.fasta
$MAKERBIN/map_fasta_ids id.map ${transcript}.renamed.fasta