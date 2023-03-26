# Dependencies

General     
- python3     
- perl    
- R        
        
GTF creation/cleanup 
- htslib    
- bioinfokit 
- gff3sort     
          
RNASeq pipeline         
- CHURP (https://github.umn.edu/MSI-RIS/CHURP/wiki)      
      
DEG analysis  
- edgeR
         


# Filepaths


Data: `/panfs/roc/data_release/1/bmgc/morrellp/nextseq/191017_NB551498_0002_AH5WMMBGXC/Morrell_Project_018  ` 

Churp: `/home/riss/public/CHURP/0.2.0/churp.py`    

CSV: `/scratch.global/lee02326/RNASeq/NMU/nmu.csv`       
     
HISAT: `/panfs/jay/groups/9/morrellp/shared/References/Reference_Sequences/Soybean/PhytozomeV11/Gmax/assembly/hisat2_files/Gmax_275_v2.0`      
    
GTF: `/panfs/jay/groups/9/morrellp/shared/References/Reference_Sequences/Soybean/PhytozomeV11/Gmax/annotation/Gmax_275_Wm82.a2.v1.gene_exons.gtf.gz`     
Working GTF: `/scratch.global/lee02326/RNASeq/GmaxWm82ISU_01_724_v2.1.gene_exons.sorted.gtf.gz`         

        
Custom adapters                
`--trimmomatic-opts="ILLUMINACLIP:/path/to/adapters.fa:4:15:7:2:true LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:18"`

Adapters:     
`
/scratch.global/lee02326/adapters.fa
`
         
    
          
# Scripts             
          
Gff3 to gtf (old):         
`
gffread GmaxWm82ISU_01_724_v2.1.gene.gff3 -T -o GmaxWm82ISU_01_724_v2.1.gene.gtf
`     

Gff3 to gtf:         
`
python3
`        
`
import bioinfokit.analys as an
`         
`
an.gff.gff_to_gtf(GmaxWm82ISU_01_724_v2.1.gene_exons.gff3)
` 
  
Sort gtf file:         
`
perl ~/workspace/gff3sort/gff3sort.pl --precise --chr_order natural ~/workspace/RNASeq/GmaxWm82ISU_01_724_v2.1.gene.gtf > ~/workspace/RNASeq/GmaxWm82ISU_01_724_v2.1.gene.sorted.gtf
`             
           
`
perl ~/workspace/gff3sort/check-disorder.pl ~/workspace/RNASeq/GmaxWm82ISU_01_724_v2.1.gene.sorted.gtf
`
                    
Get "Chr##" format:   
`
sed -i -r "s/^Gm/Chr/g" ~/workspace/RNASeq/GmaxWm82ISU_01_724_v2.1.gene.sorted.gtf  
`      
           
Script to run all samples:         
`

`

Script for one sample:  

NMU     
File path: `/scratch.global/lee02326/RNASeq/NMU/`     
`
$CHURP bulk_rnaseq -e /scratch.global/lee02326/RNASeq/NMU/nmu.csv -f /scratch.global/lee02326/RNASeq/NMU -x /panfs/jay/groups/9/morrellp/shared/References/Reference_Sequences/Soybean/PhytozomeV11/Gmax/assembly/hisat2_files/Gmax_275_v2.0 -g /scratch.global/lee02326/RNASeq/GmaxWm82ISU_01_724_v2.1.gene_exons.sorted.gtf.gz -o /scratch.global/lee02326/RNASeq/NMU/out/ -d /scratch.global/lee02326/RNASeq/NMU/work/ --strand FR -q amdsmall --ppn 4 --mem 24000 -w 2 --no-submit --trimmomatic-opts="ILLUMINACLIP:/scratch.global/lee02326/adapters.fa:4:15:7:2:true LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:18" 
`




FN (fast neutron)           
File path: `/scratch.global/lee02326/RNASeq/FN/`              


WPT (UMN transgenics)         
File path: `/scratch.global/lee02326/RNASeq/WPT/`                  


WTP (UMN tissue culture) 
File path: `/scratch.global/lee02326/RNASeq/WTP/`        


MT (UG transgenics)     
File path: `/scratch.global/lee02326/RNASeq/MT/`   


MR (UG tissue culture)      
File path: `/scratch.global/lee02326/RNASeq/MR/`    

