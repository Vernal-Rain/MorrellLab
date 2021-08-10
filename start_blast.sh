cd /scratch.global/pmorrell/Cowpea

for FOLDER in fasta*
do
	sbatch blast_general.sh FOLDER
done