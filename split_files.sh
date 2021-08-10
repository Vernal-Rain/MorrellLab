cd /scratch.global/pmorrell/Cowpea

i=0
dir=fasta_$i
mkdir $dir

for FILE in *.fasta
do 
	if [ls $dir | wc -l > 100]; then
	((i++))
	dir=fasta_$i
	mkdir $dir
	fi

	mv FILE $dir
done