#!/usr/bin/env bash

#SBATCH --cpus-per-task=8
#SBATCH --mem=60G
#SBATCH --time=01:00:00
#SBATCH --job-name=jellyfish_histo
#SBATCH --mail-user=Leo.Wuetschert@unifr.ch
#SBATCH --mail-type=end
#SBATCH --partition=pibu_el8


OUTPUT_DIR=/data/users/lwuetschert/assembly-annotation-course/jellyfish

module load Jellyfish/2.3.0-GCC-10.3.0 

jellyfish histo -t 4 $OUTPUT_DIR/St-0.jf > $OUTPUT_DIR/St-0.histo