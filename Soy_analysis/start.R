library(readr)
library(edgeR)

df <- read.table(file='DE_list.txt', sep='\t', header=TRUE, row.names='genes')
df <- data.frame(df)
df <- subset(df, select=-c(logFC))


# group <- factor(c(1,1,2,2))
y <- DGEList(counts=df)
y <- calcNormFactors(y)


