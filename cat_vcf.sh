#!/bin/bash -l
#SBATCH --time=01:00:00
#SBATCH --ntasks=16
#SBATCH --mem=32g
#SBATCH --tmp=32g
#SBATCH --mail-type=ALL
#SBATCH --mail-user=lee02326@umn.edu

set -e
set -u
set -o pipefail

module load bcftools

DIR=/scratch.global/lee02326/TZ30_vcfs
NAME=$1
cd "$DIR"

bcftools concat -O v -o "$NAME.vcf" *.vcf
