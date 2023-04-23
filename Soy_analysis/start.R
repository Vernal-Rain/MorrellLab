library(readr)
library(edgeR)

groups <- list("Counts_NMU", "Counts_FN", "Counts_MT", "Counts_MR", "Counts_WTP", "Counts_WPT")
for (x in groups)
{
setwd(paste("C:/Users/Elaine Lee/MorrellLab/Soy_analysis/", x, sep=""))

subread_cts <- read.table("subread_counts.txt", header=TRUE, sep="\t")
raw_read_cts <- as.matrix(subread_cts[,-c(1:6)])
rownames(raw_read_cts) <- subread_cts[, 1]

dat <- raw_read_cts[rowSums(raw_read_cts[])>0,]
group <- factor(c(1,1,1,1,2,2,2,2,2))
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
