

caminata <- function(z,x=100){
    k <- 1
    v <- vector("numeric",0)
    for (k in 1:z){
        v[k] <- x
        moneda <- rbinom(1,1,0.5)
        if(moneda==1){
            x <- x + 1
        } else {
            x <- x - 1
        }
    }
    plot(v,type="l", lwd=1)
}