data(swiss)
df<-swiss
head(head)
head(swiss)
str(df)
summary(swiss)
boxplot(swiss,main="Boxplots of swiss Dataset Vraibles ",col=
boxplot(swiss,main="Boxplots of swiss Dataset Vraibles ",col=="
boxplot(swiss,main="Boxplots of swiss Dataset Vraibles "
boxplot(swiss,main="Boxplots of swiss Dataset varibles",col='+='lightblu)
boxplot(swiss,main="Boxplots of swiss Dataset varible)
boxplot(swiss,col="lightblue")
# Histograms for each variable
par(mfrow = c(2, 3)) # Arrange plots in 2 rows and 3 columns
for (col in colnames(swiss)) {
  hist(swiss[[col]], main = paste("Histogram of", col), col = "lightgreen", xlab = col)
}
par(mfrow = c(1, 1)) # Reset to single plot
boxplot(swiss, main = "Boxplots of Swiss Dataset Variables", col = "lightblue")
find_outliers <- function(x) {
  Q1 <- quantile(x, 0.25)
  Q3 <- quantile(x, 0.75)
  IQR <- Q3 - Q1
  lower_bound <- Q1 - 1.5 * IQR
  upper_bound <- Q3 + 1.5 * IQR
  x[x < lower_bound | x > upper_bound]
}
# Apply the function to each variable
apply(swiss, 2, find_outliers)
pairs(swiss, 
      main = "Pair Plot of Swiss Dataset Variables",
      col = "blue", pch = 19)
pairs(swiss, 
      main = "Pair Plot of Swiss Dataset Variables",
      col = "blue", pch = 19)
df
b<-roacl
b<-roack
b<-rock
b
Once you've reviewed these correlations, let me know if you'd like to proceed to the next step: Formulating Questions for Linear Regression Analysis.
data(faithful)
head(faithful)
data(airquality)
airquality_num <- airquality[, c("Ozone", "Solar.R", "Wind", "Temp")]
head(airquality_num)
data(airquality)
airquality_num <- airquality[, c("Ozone", "Solar.R", "Wind", "Temp")]
head(airquality_num)
data(longley)
head(longley)
data(USArrests)
head(USArrests)
data(anscombe)
head(anscombe)
data(longley)
head(longley)
df5<-longley
df5
df5<-attitude
df5
data(pressure)
head(pressure)
data(euro)
head(euro)
data(attenu)
head(attenu)
f<-attenu
f
data(quakes)
head(quakes)
data(swiss)
head(swiss)
# Load the dataset
data(attenu)
# View the first few rows
head(attenu)
# Check the structure
str(attenu)
# Summary of the dataset
summary(attenu)
data(attenu)
dfn<-attenu
dfn
str(dfn)
summary(attenu)
sum(is.na(attenu))
attenu_clean <- attenu[, c("mag", "dist", "accel")]
sum(is.na(attenu))
summary(attenu)
attenu_clean <- na.omit(attenu[, c("mag", "dist", "accel")])
sum(is.na(attenu_clean))  # Confirm no missing values
for (col in c("mag", "dist", "accel")) {
  attenu[[col]][is.na(attenu[[col]])] <- mean(attenu[[col]], na.rm = TRUE)
}
for (col in c("mag", "dist", "accel")) {
  attenu[[col]][is.na(attenu[[col]])] <- median(attenu[[col]], na.rm = TRUE)
}
par(mfrow=c(1,3))
hist(attenu_clean$mag, main="Magnitude", col="skyblue", xlab="Magnitude")
hist(attenu_clean$dist, main="Distance", col="lightgreen", xlab="Distance (km)")
hist(attenu_clean$accel, main="Acceleration", col="salmon", xlab="Acceleration (g)")
data<-read.csv(""D:\17_ML_STATS\Student_Performance.csv"",header=TRUE)
data<-read.csv(""D:\17_ML_STATS\Student_Performance.csv"",header=TRUE)
data<-read.csv("D:\17_ML_STATS\Student_Performance.csv",header)
y
y
library(ISLR2)
head(Boston)
attach(Boston)
lm.fit<-lm(medv~ lstat)
exit
q()
Library(ISLR2)
library(ISLR2)
data(AUto)
data(Auto)
str(data)
str(Auto)
Auto<-data(Auto)
Auto
head(Auto)
rm(list=ls())
ls()
library(AUto)
library(ISLR2)
data(Auto)
head(Auto)
str(Auto)
range(Auto$mpg)
sapply(Auto[1:7])
sapply(Auto[1:7],range)
sapply(Auto[,sapply(Auto,is.numeric)],range)
sapply(Auto[,sapply(Auto,is.numeric)],function(x) c(mean=mean()
sapply(Auto[,sapply(Auto,is.numeric)],function(x) c(mean=mean()))
sapply(Auto[, sapply(Auto, is.numeric)], function(x) c(mean = mean(x), sd = sd(x)))
dim(Auto)
auto_subset<-Auto[-(10:85),]
dim(auto_subset)
sapply(auto_subset[,sapply(auto_subset,is.numeric)],range)
sapply(auto_subset[,sapply(auto
str(Autto)
Auto$names
names(Auto)
pairs(Auto[,1:7])
plot(Auto$horsepower,Auto$mpg,main="MPG vs Horspoewer",xlab=""HOusrepoer,ylab="MPG")
plot(Auto$horsepower,Auto$mpg,main="MPG vs Horspoewer",xlab=""HOusrepoer,ylab="MPG")
plot(Auto$horsepower,Auto$mpg,main="MPG vs Horspoewer",xla)
plot(Auto$horsepower,Auto$mpg,main="MPG vs Horspoewer")
identify(Auto$horsepower,Auto$mpg,main="MPG vs Horspoewer")
plot(Auto$horsepower,Auto$mpg,main="MPG vs Horspoewer")
pairs(Auto[,1:7])
library(Boston)
library(ISLR2)
data(Boston)
head(Boston)
names(Boston)
str(Boston)
dim(Boston)
pairs(Boston)
pairs(Boston)
?Boston
cor(Boston$crim)
cor(Boston$crim,Boston[,-which(names(Boston)=='crim')])
summary(Boston$crim)
table(Boston$chas)
cor(Boston$crim ,Boston[,-which(names(Boston)=="crim")])
cor(Boston$crim ,Boston[,-which(names(Boston)=="crim")])
median(Boston$ptratio)
min_index<-which.min(Boston$medv)
Boston[min_index,]
summary(Boston)
sum(Boston$rm>7)
sum(Boston$rm>8)
Boston[Boston$rm>8,]
savehistory("Auto_Boston_data_lab.r")
