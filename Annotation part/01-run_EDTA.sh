#!/usr/bin/env bash

#SBATCH --time=7-00:00:00
#SBATCH --mem=64G
#SBATCH --cpus-per-task=48
#SBATCH --job-name=EDTA
#SBATCH --mail-user=Leo.Wuetschert@unifr.ch
#SBATCH --mail-type=start,end
#SBATCH --partition=pibu_el8

ASSEMBLY=/data/users/lwuetschert/assembly-annotation-course/assemblies/hifiasm/ERR11437341.asm.bp.p_ctg.fa
THREADS=$SLURM_CPUS_PER_TASK

OUTDIR=/data/users/lwuetschert/assembly-annotation-course/EDTA_annotation
cd $OUTDIR 

apptainer exec --bind /usr/bin/which:/usr/bin/which --bind /data /data/courses/assembly-annotation-course/containers2/EDTA_v1.9.6.sif EDTA.pl --genome $ASSEMBLY --species others --step all --cds /data/courses/assembly-annotation-course/CDS_annotation/data/TAIR10_cds_20110103_representative_gene_model_updated --anno 1 --threads $THREADS