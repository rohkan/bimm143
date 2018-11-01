#section A
df <- data.frame(a=1:10, b=seq(200,400,length=10),c=11:20,d=NA) 
df$a <- (df$a - min(df$a)) / (max(df$a) - min(df$a))
df$b <- (df$b - min(df$a)) / (max(df$b) - min(df$b))
df$c <- (df$c - min(df$c)) / (max(df$c) - min(df$c))
df$d <- (df$d - min(df$d)) / (max(df$a) - min(df$d))  
#generalized function
rescale <- function(x) 
{
  rng <-range(x)
  (x - rng[1]) / (rng[2] - rng[1])
}

#section B
library(bio3d)
s1 <- read.pdb("4AKE")  # kinase with drug
s2 <- read.pdb("1AKE")  # kinase no drug
s3 <- read.pdb("1E4Y")  # kinase with drug
s1.chainA <- trim.pdb(s1, chain="A", elety="CA")
s2.chainA <- trim.pdb(s2, chain="A", elety="CA")
s3.chainA <- trim.pdb(s1, chain="A", elety="CA")
s1.b <- s1.chainA$atom$b
s2.b <- s2.chainA$atom$b
s3.b <- s3.chainA$atom$b
plotb3(s1.b, sse=s1.chainA, typ="l", ylab="Bfactor") 
plotb3(s2.b, sse=s2.chainA, typ="l", ylab="Bfactor") 
plotb3(s3.b, sse=s3.chainA, typ="l", ylab="Bfactor")
# beginning to optimize
import_trim2 <- function(dbID)
{
  protein <- read.pdb(dbID)
  protein.chain <- trim.pdb(protein, chain="A", elety="CA")
  plotb3(protein.chain$atom$b, sse=protein.chain, typ="l", ylab="Bfactor")
 # ex 2nd line overlay 
  #points(s2.b, type="l", col="blue", lwd=3)
}
hc <- hclust( dist( rbind(s1.b, s2.b, s3.b) ) )
plot(hc)
