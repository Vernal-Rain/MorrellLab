#!/bin/bash -l
#SBATCH --time=48:00:00
#SBATCH --ntasks=8
#SBATCH --mem=16g
#SBATCH --tmp=16g
#SBATCH --mail-type=ALL
#SBATCH --mail-user=lee02326@umn.edu

#   Written by Elaine Lee
#   26 July 2021, St Paul, MN

set -e
set -u
set -o pipefail

module load ncbi_blast+/2.8.1

#   Fill in values for the variables according to your needs.

#   Path to the executable
#   This will be something like blastn, or tblastx...
BLAST=blastn
#   The blast database we will use
#   You can point it to a local copy of an NCBI database
DB=/panfs/roc/risdb_new/blast/current/nt
#   The directory containing the SNPs to blast
TO_BLAST=/scratch.global/pmorrell/Cowpea/$1
#   The number of hits to return total for each query
NUM_HITS=5
#   The maximum e-value to return
EVALUE=0.00001
#   cd into the directory, so we can run a for-loop easily
cd ${TO_BLAST}

for SNP in *.fasta
do
#   replace the BACK .fasta with .xml
#   This is a construct only present in recent versions of Bash
    OUT_BLAST=${SNP/%.fasta/.xml}
    #   The next few lines actually perform the search
    #   If you want to BLAST against NCBI's database, add the '-remote' switch
    $BLAST -query $SNP\
    -db $DB\
    -out ${OUT_BLAST}\
    -outfmt 5\
    -max_target_seqs ${NUM_HITS}\
    -evalue ${EVALUE}
done