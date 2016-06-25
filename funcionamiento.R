n <- 1000
mensajes <- vector("character",n)
 for (i in 1:n) {
   
   x <- runif(1)
    if(x <= 0.3){
      mensajes[i] <- "30%"
    } else if (x <=0.5){
      mensajes[i] <- "20%a"
    } else if (x <=0.7){
      mensajes[i] <- "20%b"
    } else if (x <=0.9){
      mensajes[i] <- "20%c"
    } else {
      mensajes[i] <- "10%"
    }
   
 }
plot(table(mensajes))