# Ancestral state annotations      
       
## Clean up annotations file (.bed)       
       
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

    
## Make header    
        
`echo '##INFO=<ID=AA,Number=1,Type=String,Description="Ancestral state">' > hdr.txt`     

    
## Annotation   
      
`bcftools annotate -a ancestral_states.txt.gz -h hdr.txt -c CHROM,-,POS,INFO/AA reference_test_stats.vcf.gz > annotated.vcf` 

                
# SNP ID annotations   
       
## Prepare annotations file (.vcf)      
           
`bgzip IT97K_combined_genotype_snps.g.vcf`      
`tabix -p vcf IT97K_combined_genotype_snps.g.vcf.gz`            

      
## Annotation   
      
`bcftools annotate -a reference_test_stats.vcf.gz -c CHROM,POS,ID IT97K_combined_genotype_snps.g.vcf.gz > annotated_IT97K.vcf` 
