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

DIR=/scratch.global/lee02326/TZ30_vcfs
OUT_NAME=$1
cd "$DIR"

cat *.vcf | sort -k 0 > "$OUT_NAME.vcf"
