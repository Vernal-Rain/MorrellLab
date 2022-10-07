# Filepaths


Data: `/panfs/roc/data_release/1/bmgc/morrellp/nextseq/191017_NB551498_0002_AH5WMMBGXC/Morrell_Project_018  ` 

Churp: `/home/riss/public/CHURP/0.2.0/churp.py`    

CSV: `/scratch.global/lee02326/RNASeq/step1.csv`    

Fasta: `/panfs/jay/groups/9/morrellp/shared/References/Reference_Sequences/Soybean/PhytozomeV11/Gmax/assembly/Gmax_275_v2.0.fa`    
     
HISAT: `/panfs/jay/groups/9/morrellp/shared/References/Reference_Sequences/Soybean/PhytozomeV11/Gmax/assembly/hisat2_files/Gmax_275_v2.0`      
    
GTF: `/panfs/jay/groups/9/morrellp/shared/References/Reference_Sequences/Soybean/PhytozomeV11/Gmax/annotation/Gmax_275_Wm82.a2.v1.gene_exons.gtf.gz`
 
Bulk rnaseq:  
`$CHURP bulk_rnaseq -e /scratch.global/lee02326/RNASeq/groups.csv -f /panfs/roc/data_release/1/bmgc/morrellp/nextseq/191017_NB551498_0002_AH5WMMBGXC/Morrell_Project_018 -x /panfs/jay/groups/9/morrellp/shared/References/Reference_Sequences/Soybean/PhytozomeV11/Gmax/assembly/hisat2_files/Gmax_275_v2.0 -g /panfs/jay/groups/9/morrellp/shared/References/Reference_Sequences/Soybean/PhytozomeV11/Gmax/annotation/Gmax_275_Wm82.a2.v1.gene_exons.gtf.gz -o /scratch.global/lee02326/RNASeq/bulk_rnaseq/ -d /scratch.global/lee02326/RNASeq/work/ --strand U -q amdsmall --ppn 4 --mem 16000 -w 2 --no-submit`

        
NOTE: May need to add custom adapter argument         
`--trimmomatic-opts="ILLUMINACLIP:/path/to/adapters.fa:4:15:7:2:true LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:18"`


# Scripts             
Script to run all samples:         
`
$CHURP bulk_rnaseq -e /scratch.global/lee02326/RNASeq/groups.csv -f /panfs/roc/data_release/1/bmgc/morrellp/nextseq/191017_NB551498_0002_AH5WMMBGXC/Morrell_Project_018 -x /panfs/jay/groups/9/morrellp/shared/References/Reference_Sequences/Soybean/PhytozomeV11/Gmax/assembly/hisat2_files/Gmax_275_v2.0 -g /panfs/jay/groups/9/morrellp/shared/References/Reference_Sequences/Soybean/PhytozomeV11/Gmax/annotation/Gmax_275_Wm82.a2.v1.gene_exons.gtf.gz -o /scratch.global/lee02326/RNASeq/bulk_rnaseq/ -d /scratch.global/lee02326/RNASeq/work/ --trimmomatic-opts="ILLUMINACLIP:/scratch.global/lee02326/RNASeq/adapters.fa:4:15:7:2:true LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:18" --strand U -q amdsmall --ppn 4 --mem 16000 -w 2 --no-submit
`

Script for one sample:            
`
$CHURP bulk_rnaseq -e /scratch.global/lee02326/RNASeq/nmu.csv -f ~/workspace/RNASeq/NMU_links -x /panfs/jay/groups/9/morrellp/shared/References/Reference_Sequences/Soybean/PhytozomeV11/Gmax/assembly/hisat2_files/Gmax_275_v2.0 -g /panfs/jay/groups/9/morrellp/shared/References/Reference_Sequences/Soybean/PhytozomeV11/Gmax/annotation/Gmax_275_Wm82.a2.v1.gene_exons.gtf.gz -o /scratch.global/lee02326/RNASeq/out/ -d /scratch.global/lee02326/RNASeq/work/ --strand U -q amdsmall --ppn 4 --mem 16000 -w 2 --no-submit --trimmomatic-opts="ILLUMINACLIP:/scratch.global/lee02326/adapters.fa:4:15:7:2:true LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:18"   
`
