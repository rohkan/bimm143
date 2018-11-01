#Baby weight data input
weight <- read.table("bimm143_05_rstats/weight_chart.txt", header=TRUE)
#make a custom plot
plot(weight,type="o", main="Baby Weight with Age",pch=15, cex=1.5, lwd=2, ylim=c(2,10), xlab="Age (months)", ylab="Weight(kg)")
#1b bar plot
feature_count <- read.table("bimm143_05_rstats/feature_counts.txt", sep="\t", header=TRUE)
par(mar=c(3.1,11.1,4.1,2))
barplot(feature_count$Count, horiz= TRUE, ylab="", main="Mouse gene features", las=1, names.arg = feature_count$Feature, xlim=c(0,80000))
#2c histogram
hist(c(rnorm(10000), rnorm(10000)+4), breaks=80)
#look up cbind for boxplot binds things by 
#section 3
m_f_counts<- read.table("bimm143_05_rstats/male_female_counts.txt", header=TRUE, sep="\t")
col=rainbow(nrow(m_f_counts))
par(mar=c(4,4,4,4))
barplot(m_f_counts$Count,col=col, names.arg=m_f_counts$Sample, las=2, ylab="counts", main="Male and Female Counts")
#version where male and femal colored differently
col_sep=c("blue", "red")
barplot(m_f_counts$Count,col=col_sep, names.arg=m_f_counts$Sample, las=2, ylab="counts", main="Male and Female Counts")
#sc
genes <- read.table("bimm143_05_rstats/up_down_expression.txt", header=TRUE, sep="\t")
#used palette() and levels(genes$State) to match see order and then match up desired colors
palette(c("blue", "gray", "red"))
plot(genes$Condition1, genes$Condition2, col=genes$State)
#color density
meth <- read.table("bimm143_05_rstats/expression_methylation.txt", header=TRUE, sep="\t")
dcols=densCols(meth$gene.meth, meth$expression)
plot(meth$gene.meth, meth$expression, col=dcols, pch=20)
inds <- meth$expression>0
dcols=densCols(meth$gene.meth[inds], meth$expression[inds])
plot(meth$gene.meth[inds], meth$expression[inds], col=dcols, pch=20)
# change colramp
dcols=densCols(meth$gene.meth[inds], meth$expression[inds], colramp = colorRampPalette(c("blue", "green", "red", "yellow")))
plot(meth$gene.meth[inds], meth$expression[inds], col=dcols, pch=20 )
