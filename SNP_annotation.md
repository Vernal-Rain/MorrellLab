910  less combined_genotype_snps_filtered_tags.g.vcf.gz

  911  cd cowpea_annotation/

  912  ls

  913  cd Results/

  914  ls

  915  cd IT97K-499-35_v1.0/

  916  ls

  917  less i

  918  less iSelect_cowpea.vcf.gz

  919  module avail bcftools

  920  module load bcftools/1.16-gcc-8.2.0-5d4xg4y

  921  bcftools annotate

  922  cp iSelect_cowpea.vcf.gz /scratch.global/lee02326/Cowpea

  923  mkdir /scratch.global/lee02326/Cowpea

  924  cd /scratch.global/

  925  ls

  926  mkdir lee02326

  927  cd lee0232

  928  cd lee02326

  929  mkdir Cowpea

  930  cd -

  931  cd /scratch.global/pmorrell/Cowpea

  932  ls

  933  cd cowpea_annotation/

  934  ls

  935  cd Results/

  936  ls

  937  cd IT97K-499-35_v1.0/

  938  ls

  939  cp iSelect_cowpea.vcf.gz /scratch.global/lee02326/Cowpea

  940  cd ../..

  941  cd ..

  942  ls

  943  cp reference_test_stats.vcf.gz /scratch.global/lee02326/Cowpea/

  944  ls

  945  cd /scratch.global/lee02326/Cowpea/

  946  ls

  947  cp * ~/workspace/

  948  ls

  949  module load htslib

  950  ls

  951  less reference_test_stats.vcf.gz 

  952  zcat reference_test_stats.vcf.gz | awk -F'\t' '{print $1, $2-1, $3, $4}' > ref_test_stats.bed

  953  ls

  954  less ref_test_stats.bed 

  955  less reference_test_stats.vcf.gz 

  956  zcat reference_test_stats.vcf.gz | awk -F'\t' '{print $1, $2-1, $2, $3}' > ref_test_stats.bed

  957  less reference_test_stats.vcf.gz 

  958  less ref_test_stats.bed 

  959  sed -i '/##/d' ref_test_stats.bed 

  960  ls

  961  less ref_test_stats.bed 

  962  wc -l ref_test_stats.bed 

  963  ls

  964  less iSelect_cowpea.vcf.gz 

  965  less ref_

  966  less ref_test_stats.bed 

  967  bcftools annotate -c CHROM,FROM,TO,ID -a ref_test_stats.bed   -o output.vcf  iSelect_cowpea.vcf.gz 

  968  bgzip ref_test_stats.bed 

  969  bcftools annotate -c CHROM,FROM,TO,ID -a ref_test_stats.bed.gz   -o output.vcf  iSelect_cowpea.vcf.gz 

  970  bcftools annotate

  971  less

  972  less iSelect_cowpea.vcf.gz 

  973  bcftools annotate -c CHROM,POS,ID -a ref_test_stats.bed.gz   -o output.vcf  iSelect_cowpea.vcf.gz 

  974  bcftools annotate -c CHROM,POS,ID -a iSelect_cowpea.vcf.gz   -o output.vcf ref_test_stats.bed.gz 

  975  bcftools annotate -c CHROM,POS,ID -a ref_test_stats.bed.gz   -o output.vcf  iSelect_cowpea.vcf.gz 

  976  bcftools annotate -c CHROM,POS,ID -a reference_test_stats.vcf.gz   -o output.vcf  iSelect_cowpea.vcf.gz 

  977  tabix -i iSelect_cowpea.vcf.gz 

  978  ls

  979  bcftools annotate -c CHROM,POS,ID -a reference_test_stats.vcf.gz   -o output.vcf  iSelect_cowpea.vcf.gz 

  980  tabix reference_test_stats.vcf.gz 

  981  ls

  982  bcftools annotate -c CHROM,POS,ID -a reference_test_stats.vcf.gz   -o output.vcf  iSelect_cowpea.vcf.gz 

  983  ls

  984  mv output.vcf annotated.vcf

  985  ls

  986  less annotated.vcf

  987  awk -F'\t' '{print $1, $2-1, $2, $3}' annotated.vcf > ref_test_stats.bed

  988  ls

  989  less ref_test_stats.bed

  990  sed -i '/##/d' ref_test_stats.bed 

  991  less ref_test_stats.bed

  992  sed -i '/#/d' ref_test_stats.bed 

  993  less ref_test_stats.bed

  994  ls

  995  cd /scratch.global/lee02326/Cowpea

  996  ls

  997  less selected_snp_ANCESTRAL.txt 

  998  vim sele

  999  ls

 1000  cd /scratch.global/lee02326

 1001  cd workspace

 1002  cd ~/workspace

 1003  ls

 1004  mkdir ancestral_states

 1005  cd -

 1006  cp Cowpea/* ~/workspace/ancestral_states/

 1007  ls

 1008  cd Cowpea/

 1009  ls

 1010  vim selected_snp_ANCESTRAL.txt 

 1011  ls

 1012  module load htslib

 1013  module load bcftools

 1014  mv selected_snp_ANCESTRAL.txt ancestral_states.vcf

 1015  bgzip ancestral_states.vcf 

 1016  tabix ancestral_states.vcf.gz 

 1017  history
 bcftools annotate -a ances_states.txt.gz -h hdr.txt -c CHROM,-,POS,INFO/AA reference_test_stats.vcf.gz > annotated.vcf

