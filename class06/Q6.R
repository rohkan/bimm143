
#This function accepts a single character input(meant to be a pdb ID) and outputs a plot of 
import_trim <- function(pdbID)
{
  
  #if statement to check if the input is a character, I would also add a check for whether or not the input is PDB ID if I knew a function for checking that
  if(!is.character(pdbID))
  {
    stop("Please Input a character value")
  }
  
  #imports the bio3d package which contains the pdb databse
  library(bio3d)
  
  #assigns 
  protein <- read.pdb(pdbID)
  protein.chainA <- trim.pdb(protein, chain="A", elety="CA")
  protein.b <- protein.chainA$atom$b
  
  #outputs a plot
  return(plotb3( protein.b, sse=protein.chainA, typ="l", ylab="Bfactor" ))

}