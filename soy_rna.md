Filepaths


Data: /panfs/roc/data_release/1/bmgc/morrellp/nextseq/191017_NB551498_0002_AH5WMMBGXC/Morrell_Project_018   

Churp: /home/riss/public/CHURP/0.2.0/churp.py    

CSV: /scratch.global/lee02326/RNASeq/step1.csv    

Fasta: /panfs/jay/groups/9/morrellp/shared/References/Reference_Sequences/Soybean/PhytozomeV11/Gmax/assembly/Gmax_275_v2.0.fa    

GTF: /panfs/jay/groups/9/morrellp/shared/References/Reference_Sequences/Soybean/PhytozomeV11/Gmax/annotation/Gmax_275_Wm82.a2.v1.gene_exons.gtf.gz

Bulk rnaseq: python /home/riss/public/CHURP/0.2.0/churp.py bulk_rnaseq -e /scratch.global/lee02326/RNASeq/groups.csv -f /panfs/roc/data_release/1/bmgc/morrellp/nextseq/191017_NB551498_0002_AH5WMMBGXC/Morrell_Project_018 \
-x /panfs/jay/groups/9/morrellp/shared/References/Reference_Sequences/Soybean/PhytozomeV11/Gmax/assembly/ -g /panfs/jay/groups/9/morrellp/shared/References/Reference_Sequences/Soybean/PhytozomeV11/Gmax/annotation/Gmax_275_Wm82.a2.v1.gene_exons.gtf.gz -o \
/scratch.global/lee02326/RNASeq/bulk_rnaseq/ -d /scratch.global/lee02326/RNASeq/work/ --strand U --ppn 4 --mem 12000 -w 2
