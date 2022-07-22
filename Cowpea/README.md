# Variant Effect Predictor (for Cowpea_Pangenome)

Variant Effect Predictor (VEP) analysis was performed to determine the effects of SNPs and indels in both core and noncore genes
    
   
# Dependecies
- HTSlib 1.9
- CentOS 7.5.26.1
- Ensembl VEP 97.3
   
     
# Method     
Core and non-core genes were extracted from the ITK97 assembly and VEP analysis was performed on each of the following groups:     
- Core SNPs   
- Noncore SNPs  
- Core indels   
- Noncore indels   
      
      
# Files      
The following are example scripts used to run VEP:   
- vep_template.sh: Template vep file     
-  ! add example script !
     
     
# Results    
Data on SNPs and indels for core and noncore genes were plotted on a stacked bar chart to analyse the number of mutations with differing levels of severity. The code used to generate this plot is in `vep_plot.py`


