#!/bin/bash -l
#SBATCH --time=18:00:00
#SBATCH --ntasks=2
#SBATCH --mem=8g
#SBATCH --tmp=8g
#SBATCH --mail-type=ALL
#SBATCH --mail-user=lee02326@umn.edu

# This script runs Variant effect Predictor (VeP) on a set of variants
# It requires a VCF, GFF, and fasta file as input

module load htslib/1.9
module load perl/modules.centos7.5.26.1

#    Variant sets should be either 'all', deletions', 'insertions', 'snps', 'common', or 'rare'
VARIANT_SET=$1
VCF=/scratch.global/lee02326/vep/$1/*.vcf.gz
GFF=/scratch.global/lee02326/vep/$1/*.gff3.gz
FASTA=/scratch.global/lee02326/vep/$1/*.fa.gz

OUT=/scratch.global/lee02326/vep/$1
cd "${OUT}"

/home/morrellp/shared/Software/ensembl-vep-release-97.3/vep \
    -i "${VCF}" \
    --gff "${GFF}" \
    --fasta "${FASTA}" \
    --species cowpea \
    --total_length \
    --check_svs \
    --verbose \
    --format vcf \
    --force \
    --warning_file /scratch.global/lee02326/vep/${1}/${VARIANT_SET}.txt \
    -o /scratch.global/lee02326/vep/${1}/${VARIANT_SET}.txt
