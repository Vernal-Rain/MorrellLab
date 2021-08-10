cd /scratch.global/pmorrell/Cowpea

for FOLDER in fasta_*
do
	sbatch blast_general.sh $FOLDER
done
