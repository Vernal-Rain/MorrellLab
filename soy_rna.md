# Filepaths


Data: `/panfs/roc/data_release/1/bmgc/morrellp/nextseq/191017_NB551498_0002_AH5WMMBGXC/Morrell_Project_018  ` 

Churp: `/home/riss/public/CHURP/0.2.0/churp.py`    

CSV: `/scratch.global/lee02326/RNASeq/NMU/nmu.csv`    

Fasta: `/panfs/jay/groups/9/morrellp/shared/References/Reference_Sequences/Soybean/PhytozomeV11/Gmax/assembly/Gmax_275_v2.0.fa`    
     
HISAT: `/panfs/jay/groups/9/morrellp/shared/References/Reference_Sequences/Soybean/PhytozomeV11/Gmax/assembly/hisat2_files/Gmax_275_v2.0`      
    
GTF: `/panfs/jay/groups/9/morrellp/shared/References/Reference_Sequences/Soybean/PhytozomeV11/Gmax/annotation/Gmax_275_Wm82.a2.v1.gene_exons.gtf.gz`

        
Custom adapters                
`--trimmomatic-opts="ILLUMINACLIP:/path/to/adapters.fa:4:15:7:2:true LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:18"`

Adapters:     
`
/scratch.global/lee02326/adapters.fa
`



# Scripts             

Sort gtf file:         
`
perl ~/workspace/gff3sort/gff3sort.pl --precise --chr_order natural ~/workspace/RNASeq/GmaxWm82ISU_01_724_v2.1.gene.gtf > ~/workspace/RNASeq/GmaxWm82ISU_01_724_v2.1.gene.sorted.gtf
`             
           
`
perl ~/workspace/gff3sort/check-disorder.pl ~/workspace/RNASeq/GmaxWm82ISU_01_724_v2.1.gene.sorted.gtf
`
                    
Script to run all samples:         
`

`

Script for one sample:  

NMU     
File path: `/scratch.global/lee02326/RNASeq/NMU/`     
`
$CHURP bulk_rnaseq -e /scratch.global/lee02326/RNASeq/NMU/nmu.csv -f /scratch.global/lee02326/RNASeq/NMU -x /panfs/jay/groups/9/morrellp/shared/References/Reference_Sequences/Soybean/PhytozomeV11/Gmax/assembly/hisat2_files/Gmax_275_v2.0 -g /scratch.global/lee02326/RNASeq/Glycine_max.Glycine_max_v2.1.42.chr.sorted.gtf.gz -o /scratch.global/lee02326/RNASeq/NMU/out/ -d /scratch.global/lee02326/RNASeq/NMU/work/ --strand FR -q amdsmall --ppn 4 --mem 16000 -w 2 --no-submit --trimmomatic-opts="ILLUMINACLIP:/scratch.global/lee02326/adapters.fa:4:15:7:2:true LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:18" 
`
                     
With new fasta:            
`$CHURP bulk_rnaseq -e /scratch.global/lee02326/RNASeq/NMU/nmu.csv -f /scratch.global/lee02326/RNASeq/NMU -x /panfs/jay/groups/9/morrellp/shared/References/Reference_Sequences/Soybean/PhytozomeV11/Gmax/assembly/hisat2_files/Gmax_275_v2.0 -g /scratch.global/lee02326/RNASeq/Glycine_max.Glycine_max_v2.1.42.chr.sorted.gtf.gz -o /scratch.global/lee02326/RNASeq/NMU/out/ -d /scratch.global/lee02326/RNASeq/NMU/work/ --strand FR -q amdsmall --ppn 4 --mem 16000 -w 2 --no-submit --trimmomatic-opts="ILLUMINACLIP:/scratch.global/lee02326/adapters.fa:4:15:7:2:true LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:18" 
`


FN (fast neutron)           
File path: `/scratch.global/lee02326/RNASeq/FN/`              
`
$CHURP bulk_rnaseq -e /scratch.global/lee02326/RNASeq/FN/fn.csv -f /scratch.global/lee02326/RNASeq/FN -x /panfs/jay/groups/9/morrellp/shared/References/Reference_Sequences/Soybean/PhytozomeV11/Gmax/assembly/hisat2_files/Gmax_275_v2.0 -g /scratch.global/lee02326/RNASeq/Glycine_max.Glycine_max_v2.1.42.chr.sorted.gtf.gz -o /scratch.global/lee02326/RNASeq/FN/out/ -d /scratch.global/lee02326/RNASeq/FN/work/ --strand FR -q amdsmall --ppn 4 --mem 16000 -w 2 --no-submit --trimmomatic-opts="ILLUMINACLIP:/scratch.global/lee02326/adapters.fa:4:15:7:2:true LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:18"
`

WPT (UMN transgenics)         
File path: `/scratch.global/lee02326/RNASeq/WPT/`                  


WTP (UMN tissue culture) 
File path: `/scratch.global/lee02326/RNASeq/WTP/`        


MT (UG transgenics)     
File path: `/scratch.global/lee02326/RNASeq/MT/`   


MR (UG tissue culture)      
File path: `/scratch.global/lee02326/RNASeq/MR/`    

