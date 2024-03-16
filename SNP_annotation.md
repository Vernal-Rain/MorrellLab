# Clean up annotations file    
       
Transform file to bed format

`awk -F'\t' '{print $1, $2-1, $2, $5}' selected_snp_ANCESTRAL.txt > ancestral_states.txt`

Remove uncertain (<80%) ancestral states    
     
`sed -i '/0.[234567]/d' ancestral_states.txt`
     
Remove "AA=" part
`sed -e 's/AA=//g' ancestral_states.txt`   
  
Load required modules         
`module load htslib`    
`module load bcftools`
    
Zip annotations file        
`bgzip ancestral_states.txt`
       
Index annotations file      
`tabix -p bed ancestral_states.txt.gz`   

    
# Make header    
        
`echo '##INFO=<ID=AA,Number=1,Type=String,Description="Ancestral state">' > hdr.txt`     

    
# Annotation   
      
`bcftools annotate -a ancestral_states.txt.gz -h hdr.txt -c CHROM,-,POS,INFO/AA reference_test_stats.vcf.gz > annotated.vcf` 

