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
VCF=/scratch.global/lee02326/vep/barley/$2
GFF=/scratch.global/lee02326/vep/barley/$3
FASTA=/scratch.global/lee02326/vep/barley/$4

OUT=/scratch.global/lee02326/vep/barley/
cd "${OUT}"

/home/morrellp/shared/Software/ensembl-vep-release-97.3/vep \
    -i "${VCF}" \
    --gff "${GFF}" \
    --fasta "${FASTA}" \
    --species barley \
    --total_length \
    --check_svs \
    --verbose \
    --format vcf \
    --force \
    --warning_file /scratch.global/lee02326/vep/barley/"barley_${VARIANT_SET}.txt" \
    -o /scratch.global/lee02326/vep/barley/"barley_${VARIANT_SET}.txt"
