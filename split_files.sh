#!/bin/bash -l

cd /scratch.global/pmorrell/Cowpea/testing2

i=0
dir="fasta_$i"
mkdir "$dir"

for FILE in *.fasta
do 
	count=$(ls "$dir" | wc -l)
	if [[ "$count" -gt 75 ]]; then
		((++i))
		dir="fasta_$i"
		mkdir "$dir"
	fi

	mv "$FILE" "$dir"
done
