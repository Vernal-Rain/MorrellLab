#Make annotations file       
`module load htslib`    
`module load bcftools`    
`bgzip ancestral_states.txt`    
`tabix -p bed ancestral_states.txt.gz`             

#Annotation            
`bcftools annotate -a ancestral_states.txt.gz -h hdr.txt -c CHROM,-,POS,INFO/AA reference_test_stats.vcf.gz > annotated.vcf` 

