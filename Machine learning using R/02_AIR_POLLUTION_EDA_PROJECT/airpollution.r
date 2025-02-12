data<-read.csv("D:/21_ML_STATS/DATA/air-pollution.csv",header=TRUE)
data
sample(data)
str(data)
summary(data)
colSums(is.na(data))
data<-na.omit(data)
colSums(is.na(data))
par(mfrow=c(3,3))
for(col in names(data)){
if(is.numeric(data[col]){)
for(col in names(data)){ if (is.numeric(data[[col]])){ hist(data[[col]],main=paste('hitogram of',col),xlab=col,col='skyblue')}}
par(mfrow=c(3,3))
for(col in names(data)){ if (is.numeric(data[[col]])){ hist(data[[col]],main=paste('hitogram of',col),xlab=col,col='skyblue')}}
par(mfrow=c(3,3))
for (col in names(dtaa)){if(is.numeric(data[[col]])){boxplot(data[[col]],main=paste('Boxplot of',col),col="lightgreen")}}
for (col in names(data)){if(is.numeric(data[[col]])){boxplot(data[[col]],main=paste('Boxplot of',col),col="lightgreen")}}
cor_matrix<-  cor(data[,sapply(data,is.numeric)])
heatmap(cor_matrix,main="correlation Heatmap",col=heat.colors(10))
y<- data$Mortality
x<-data$JanTemp
mean_x<-mean(x)
mean_y<-mean(y)
numerator<-sum((x-mean_x)*(y-mean_y))
denominator<-sum((x-mean_x)^2)
b1<- numerator/denominator
cat("Slope (b1):",b1,"\n")
b0<-mean_y-b1*mean_x
cat("intercept(b0)",b0,"\n")
predictions<-b0+b1*x
cat("predictionv:\n",predictions[1:10],'\n')
cat("predictions:\n",predictions[1:10],'\n')
mse<-mean((y-predictions)^2)
cat("Mean Squared Error (MSE)",mse,'\n')
savehistory("D:/20_MACHINE_LEARNING/Machine learning using R/airpollution.r")
