anscombe
summary(anscombe)
is.matrix(anscombe)
is.dataframe(anscombe)
is.data.frame(anscombe)
dim(anscombe)
colMeans(anscombe)
help(apply)
help(apply)
apply(anscombe,2,mean)
apply(anscombe,1,mean)
apply(anscombe,3,mean)
dim(anscombe)
apply(anscombe,3,mean)
apply(anscombe,2,mean)
head(anscombe)
apply(anscombe,2,var)
apply(anscombe,2,sd)
apply(anscombe,2,mad)
apply(anscombe,2,min)
summary(anscombe)
ct<-cor.test(anscombe[,1],anscombe[,5])
head(ct)
ct
ct<-cor.test(anscombe[,1],anscombe[,5])
ct
is.list(ct)
ct[[4]]
ct<-cor.test(anscombe[,1],anscombe[,5])
ct[[4]]
ct
names(ct)
ct[[4]]
c(ct[[4]],ct[[9]])
c(ct$estimate , ct$conf.int)
cxy<-
s
cxy<-NULL
for ( i in 1:4 ) { ct <- cor.test( anscombe[,i], anscombe[,i+4] ); cxy <- rbind( cxy, c( ct$estimate, ct$conf.int ))
d
d
d
d
}
for ( i in 1:4 ) { ct <- cor.test( anscombe[,i], anscombe[,i+4] ); cxy <- rbind( cxy, c( ct$estimate, ct$conf.int ))}
cxy
cxy <- NULL; for ( i in 1:4 ) { ct <- cor.test( anscombe[,i], anscombe[,i+4] ); cxy <- rbind( cxy, c( ct$estimate, ct$conf.int ) ) }
cxy
cxy_demo <- NULL; for ( i in 1:4 ) { ct <- cor.test( anscombe[,i], anscombe[,i+4] ); cxy <- rbind( cxy, c( ct$estimate, ct$conf.int ) ) }
cxy_demo
cxy
cxy <- NULL; for ( i in 1:4 ) { ct <- cor.test( anscombe[,i], anscombe[,i+4] ); cxy <- rbind( cxy, c( ct$estimate, ct$conf.int ) ) }
cxy
fits <- NULL; for ( i in 1:4 ) { lf <- lm( anscombe[,i+4] ~ anscombe[,i] ); fits <- rbind( fits, coef( lf ) ) }
fits
op <- par( mfrow=c( 2, 2 ) )
for ( i in 1:4 ) plot( anscombe[,i], anscombe[,i+4] )
for ( i in 1:4 ) { lf <- lm( anscombe[,i+4] ~ anscombe[,i] ); plot( anscombe[,i], anscombe[,i+4] ); abline( coef( lf ) ) }
dev.off()
op<-par(mfrow=c(2,2))
for ( i in 1:4 ) { lf <- lm( anscombe[,i+4] ~ anscombe[,i] ); plot( anscombe[,i], anscombe[,i+4] ); abline( coef( lf ) ) }
for ( i in 1:4 ) { lf <- lm( anscombe[,i+4] ~ anscombe[,i] ); plot( anscombe[,i], anscombe[,i+4] ); abline( coef( lf ) ) }
for ( i in 1:4 ) { lf <- lm( anscombe[,i+4] ~ anscombe[,i] ); plot( anscombe[,i], anscombe[,i+4] ); abline( coef( lf ) ) }
op <- par( mfrow=c( 2, 2 ) )
for ( i in 1:4 ) { lf <- lm( anscombe[,i+4] ~ anscombe[,i] ); plot( anscombe[,i], anscombe[,i+4] ); abline( coef( lf ) ) }
savehistory("D:/20_MACHINE_LEARNING/Machine learning using R/SIR_PRACTICE_ANSCOMBE.r")
