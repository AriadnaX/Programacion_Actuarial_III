funcion <- function(n,m,distribucion,..){
    y <- sapply(lapply(rep(m,n),distribucion),mean)
    hist(y)
    
}



