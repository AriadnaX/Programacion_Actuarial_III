

corr <- function(directorio, horizonte=0){
  setwd("~/ariadna/Programacion_Actuarial_III/specdata")
  corre <- vector("numeric",0)
  j <- 1  
   for(i in 1:332){
     r <- read.csv(paste(formatC(i, width=3,flag= "0"),".csv",sep=""),header=TRUE)
     md<- data.frame(r$sulfate,r$nitrate)
      no <- nrow(md[complete.cases(md),])
     
      if(no > horizonte){
        corre[j] <- cor(md[complete.cases(md),][,1],md[complete.cases(md),][,2])
        j <- j+1
      }
   }
  corre
}
