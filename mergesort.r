merge<-function(a,b) {
    r<-numeric(length(a)+length(b))
    ai<-1; bi<-1; j<-1;
    for(j in 1:length(r)) {
        if((ai<=length(a) && a[ai]<b[bi]) || bi>length(b)) {
            r[j] <- a[ai]
            ai <- ai+1
        } else {
            r[j] <- b[bi]
            bi <- bi+1          
        }
    }
    r
}
msort<-function(A) {
    if(length(A)>1) {
        q <- ceiling(length(A)/2)
        a <- msort(A[1:q])
        b <- msort(A[(q+1):length(A)])
        merge(a,b)
    } else {
        A
    }
}

res<-c(5,9,1,3,4,6,6,3,2)
msort(res)
