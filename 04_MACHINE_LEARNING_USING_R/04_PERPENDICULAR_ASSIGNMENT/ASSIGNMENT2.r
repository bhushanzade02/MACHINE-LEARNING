set.seed(42)  
n<-100  
x<-rnorm(n, mean=3, sd=8)
noise<-rnorm(n, mean=0, sd=50)
slope<-5
intercept<-2
y<- (slope*x+intercept)+noise
sumx<-sum(x)
sumy<-sum(y)
sumxy<-sum(x*y)
sumx2<-sum(x^2)
a<-(n*sumxy - sumy*sumx)/(n*sumx2 - sumx^2)
b<-(sumy-a*sumx)/n
plot(x,y)
curve(slope*x + intercept, col="blue", lwd=2, add=TRUE)
curve(a*x + b, col="red", lwd=2, add=TRUE)
legend("topleft", legend=c("True Line", "Estimated Line"),
       col=c("blue", "red"), lty=c(1,1),lwd=2)
savehistory("D:/21_ML_STATS/ASSIGNMENT/ASSIGNMENT2.r")
