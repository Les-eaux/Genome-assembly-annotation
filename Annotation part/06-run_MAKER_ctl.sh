#!/usr/bin/env bash

#SBATCH --time=00:20:00
#SBATCH --mem=2G
#SBATCH --cpus-per-task=4
#SBATCH --job-name=MAKER_CTL
#SBATCH --mail-user=Leo.Wuetschert@unifr.ch
#SBATCH --mail-type=start,end
#SBATCH --partition=pibu_el8

WORKDIR=/data/users/lwuetschert/assembly-annotation-course/gene_annotation

cd $WORKDIR

apptainer exec --bind /data \
/data/courses/assembly-annotation-course/CDS_annotation/containers/MAKER_3.01.03.sif maker -CTL