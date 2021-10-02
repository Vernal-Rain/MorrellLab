#!/bin/bash -l

cd /scratch.global/pmorrell/Cowpea/testing2

for FOLDER in fasta_*
do
	sbatch ~/"workspace/blast_general.sh" "testing2/$FOLDER"
done
