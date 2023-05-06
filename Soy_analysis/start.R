library(readr)
library(edgeR)

groups <- list("NMU", "FN", "MT", "MR", "WTP", "WPT")

for (x in groups)
{
  setwd(paste("C:/Users/Elaine Lee/MorrellLab/Soy_analysis/Counts_", x, sep=""))
  
  subread_cts <- read.table("subread_counts.txt", header=TRUE, sep="\t")
  raw_read_cts <- as.matrix(subread_cts[,-c(1:6)])
  rownames(raw_read_cts) <- subread_cts[, 1]
  
  dat <- raw_read_cts[rowSums(raw_read_cts[])>0,]
  
  c1 <- switch(x, 
               "NMU" = c(1,1,1,1,2,2,2,2,2), 
               "FN" = c(1,1,1,1,1,1,2,2,2,2,2),
               "MT" = c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2),
               "MR" = c(1,1,1,1,2,2,2,2,2),
               "WTP" = c(2,2,2,2,2,1,1,1,1),
               "WPT" = c(2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1))
  group <- factor(c1)
  y <- DGEList(counts=dat, group=group)
  
  
  keep <- filterByExpr(y)
  y <- y[keep,,keep.lib.sizes=FALSE]
  y <- calcNormFactors(y)
  design <- model.matrix(~group)
  y <- estimateDisp(y, design)
  
  fit <- glmQLFit(y, design)
  qlf <- glmQLFTest(fit, coef=2)
  top <- topTags(qlf, sort.by="PValue", n=20)
  write.table(top, file="top_tags.txt", sep="\t")
}

