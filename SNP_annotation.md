# Make annotations file  

1. Load required modules         
`module load htslib    
module load bcftools`
    
3. Zip annotations file        
`bgzip ancestral_states.txt`
       
5. Index annotations file      
`tabix -p bed ancestral_states.txt.gz`   

# Make header    
        
`echo '##INFO=<ID=AA,Number=1,Type=String,Description="Ancestral state">' > hdr.txt`     

# Annotation   
      
`bcftools annotate -a ancestral_states.txt.gz -h hdr.txt -c CHROM,-,POS,INFO/AA reference_test_stats.vcf.gz > annotated.vcf` 

