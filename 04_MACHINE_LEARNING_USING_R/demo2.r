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
library(ISLR2)
data(Auto)
Auto_num<-Auto[,-which(names(Auto)=="name")]
pairs(Auto_num)
cor_matrix<-cor(Auto_num)
round(cor_matrix,2)
round(cor_matrix)
round(cor_matrix,4)
lm.full<-lm(mpg~.-name,Auto)
summary(Auto)
par(mfrow=c(2,2))
plot(lm_full)
plot(lm.full)
lm_interact<-lm(mpg~Auto$horsepower*Auto
lm_interact<-lm(Auto$mpg~Auto$horsepower*Auto$weight+Auto$acceleration+Auto$year+Auto$cylinders+Auto$origin+Auto$displacement,Auto)
summary(lm_interact)
plot(lm_interact)
attach(Auto)
lm.demp<-lm(mpg~horsepower)
lm.log<-lm(mpg~log(horsepower))
library(ISRL2)
data("carseats")
data("Carseats")
names(Carseats)
lm.fit<-lm(Carseats$Sales~Carseats$Price+Carseats$Urban+Carseats$US)
summary(lm.fit)
attach(Carseats)
model_e<-lm(Sales~Price+US,data=Carseats)
summary(model_e)
summary(model_e)$r.sq
summary(lm.fit)$r.sq
confint(model_e)
par(mfrow=c(2,2))
plot(model_e)
par(mfrow=c(2,2))
plot(model_e)
savehistory("demo2.r")
