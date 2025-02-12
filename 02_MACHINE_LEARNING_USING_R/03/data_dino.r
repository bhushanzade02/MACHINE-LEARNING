data<-read.csv("D:/21_ML_STATS/datasaurusdozen-wide.csv")
head(data)
is.matrix(data)
is.list(data)
str(data)
summary(data)
data<-data[-1,]
data<-data.framed(lapply(data,as.numeric))
data<-data.frame(lapply(data,as.numeric))
str(data)
summary(data)
cor_matrix<-cor(data,use="complete.obs")
cor_matrix
par(mfrow=c(3,3)) 
for(col in names(data)){
hist(data[[col]],main=paste('histogram of',col),xlab=col,col="skyblue",border="white")}
hist(data[[col]],main=paste('histogram of',col),xlab=col,col="skyblue",border="white")}
par(mfrow=c(1,1))
boxplot(data,main="boxplot of all varibale ",col="orange",las=2)
pairs(data[1:6],main="scatter plot matrix")
fit<-lm(data[[2]]~dat[[1]])
fit<-lm(data[[2]]~data[[1]])
summary(fit)
plot(data[[1]],data[[2]],main="scatter plot with regression line ",xlab="x",ylab="y")
abline(fir,col="red")
abline(fit,col="red")
savehistory("D:/20_MACHINE_LEARNING/Machine learning using R/data_dino.r")
