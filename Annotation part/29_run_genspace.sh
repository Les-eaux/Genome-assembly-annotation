#!/bin/bash

#SBATCH --time=02:00:00
#SBATCH --mem=20G
#SBATCH --cpus-per-task=20
#SBATCH --job-name=genespace
#SBATCH --partition=pibu_el8

COURSEDIR=/data/courses/assembly-annotation-course/CDS_annotation
WORKDIR=/data/users/lwuetschert/assembly-annotation-course
GENESPACE=/data/users/lwuetschert/assembly-annotation-course/genespace

apptainer exec --bind $COURSEDIR --bind "$WORKDIR" --bind "$SCRATCH:/temp" "$COURSEDIR/containers/genespace_latest.sif" Rscript "$WORKDIR/scripts_annotation/25-Genespace.R" $GENESPACE 

