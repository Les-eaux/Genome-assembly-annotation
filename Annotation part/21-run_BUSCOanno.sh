#!/usr/bin/env bash

#SBATCH --time=1-00:00:00
#SBATCH --mem=32G
#SBATCH --cpus-per-task=24
#SBATCH --job-name=BUSCO
#SBATCH --mail-user=Leo.Wuetschert@unifr.ch
#SBATCH --mail-type=start,end
#SBATCH --partition=pibu_el8

PROTEINS=/data/users/lwuetschert/assembly-annotation-course/final_annotation/ERR11437341.asm.bp.p_ctg.all.maker.proteins.fasta.renamed.longest.fasta
OUTDIR=/data/users/lwuetschert/assembly-annotation-course/BUSCO_annotation


module load BUSCO/5.4.2-foss-2021a

busco -i $PROTEINS -l brassicales_odb10 -o busco_prot --out_path $OUTDIR -m proteins -f --cpu 24