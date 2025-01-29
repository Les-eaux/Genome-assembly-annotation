#!/usr/bin/env bash

#SBATCH --time=01:00:00
#SBATCH --mem=4G
#SBATCH --cpus-per-task=8
#SBATCH --job-name=grep_seqKit
#SBATCH --mail-user=Leo.Wuetschert@unifr.ch
#SBATCH --mail-type=start,end
#SBATCH --partition=pibu_el8

COPIA=/data/users/lwuetschert/assembly-annotation-course/results_TEsorter/Copia_sequences.fa.rexdb-plant.dom.faa
GYPSY=/data/users/lwuetschert/assembly-annotation-course/results_TEsorter/Gypsy_sequences.fa.rexdb-plant.dom.faa

module load SeqKit/2.6.1

# for gypsy
grep Ty3-RT $GYPSY > list_G.txt #make a list of RT proteins to extract
sed -i 's/>//' list_G.txt #remove ">" from the header
sed -i 's/ .\+//' list_G.txt #remove all characters following "empty space" from the header
seqkit grep -f list_G.txt $GYPSY -o Gypsy_RT.fasta

# for copia
grep Ty1-RT $COPIA > list_C.txt #make a list of RT proteins to extract
sed -i 's/>//' list_C.txt #remove ">" from the header
sed -i 's/ .\+//' list_C.txt #remove all characters following "empty space" from the header
seqkit grep -f list_C.txt $COPIA -o Copia_RT.fasta