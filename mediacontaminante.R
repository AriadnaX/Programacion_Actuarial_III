
mediacontaminante <- function(directorio,contaminante,id=1:332){
  setwd("~/ariadna/Programacion_Actuarial_III/specdata")
  s <-numeric()
 
  for(i in id){
  
    r <- read.csv(paste(formatC(i, width=3,flag= "0"),".csv",sep=""),header=TRUE)
    
     if(contaminante == "sulfate"){
      s <- c(s,r$sulfate)
     } else if (contaminante == "nitrate"){
      s<- c(s,r$nitrate)
     } 
  }
  promedio <- mean(s, na.rm=TRUE)
  promedio
  
}

  