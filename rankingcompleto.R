

rankingcompleto <- function(resultado, num = "mejor") {
  
  data <- read.csv("outcome-of-care-measures.csv")
  
  if (resultado == "ataque") {
    col <- 11
  } else if (resultado == "falla") {
    col <- 17 
  } else {
    col <- 23
  }
  
  a <- matrix(data[, col], 4706,1)
  data[, col] <- suppressWarnings(as.numeric(a))
  data[, 2] <- as.character(data[, 2])

  e <- levels(data[, 7])
  
  for(i in 1:length(e)) {
    b <- data[grep(e[i], data$State), ]
    Orden <- b[order(b[, col], b[, 2], na.last = NA), ]
    
    if(num == "mejor") {
      h <- Orden[1, 2]
    } else if(num == "peor") {
      h <- Orden[nrow(Orden), 2]
    } else{
      h <- Orden[num, 2]
    }
    
    r <- append(r,c(e[i],h)) 
    
  }
  
  r<- data.frame(matrix(r, length(e), 2, byrow=TRUE))

  if (!((resultado == "ataque") | (resultado == "falla")
        | (resultado == "neumonia"))) {
    stop ("resultado inválido")
  }
  colnames(r) <- c("Estado","Hospital")
   r

}


