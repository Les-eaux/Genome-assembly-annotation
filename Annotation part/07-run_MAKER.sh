#!/bin/bash
#SBATCH --time=7-0
#SBATCH --mem=64G
#SBATCH -p pibu_el8
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=50
#SBATCH --job-name=Maker
#SBATCH --mail-user=Leo.Wuetschert@unifr.ch
#SBATCH --mail-type=start,end
#SBATCH --output=/data/users/lwuetschert/assembly-annotation-course/gene_annotation/Maker_gene_annotation_%j.out
#SBATCH --error=/data/users/lwuetschert/assembly-annotation-course/scripts_annotation/Maker_gene_annotation_%j.err


COURSEDIR=/data/courses/assembly-annotation-course/CDS_annotation
WORKDIR=/data/users/lwuetschert/assembly-annotation-course/gene_annotation
REPEATMASKER_DIR=/data/courses/assembly-annotation-course/CDS_annotation/softwares/RepeatMasker

cd $WORKDIR

export PATH=$PATH:"/data/courses/assembly-annotation-course/CDS_annotation/softwares/RepeatMasker"
module load OpenMPI/4.1.1-GCC-10.3.0
module load AUGUSTUS/3.4.0-foss-2021a
mpiexec --oversubscribe -n 50 apptainer exec --bind $SCRATCH:/TMP --bind $COURSEDIR --bind $AUGUSTUS_CONFIG_PATH --bind $REPEATMASKER_DIR ${COURSEDIR}/containers/MAKER_3.01.03.sif maker -mpi --ignore_nfs_tmp -TMP /TMP maker_opts.ctl maker_bopts.ctl maker_evm.ctl maker_exe.ctl