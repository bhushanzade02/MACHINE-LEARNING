library(ggplot2)

df <- read.csv("../Downloads/advertising.csv")

# 1.1 Describe your data
str(df)   # Check structure
dim(df)   # Check dimensions
summary(df) # Summary statistics

# Domain context
# The dataset contains advertising spend across TV, Radio, and Newspaper, and their effect on Sales.

# Summaries of variables
sapply(df, function(x) c(mean=mean(x), median=median(x), sd=sd(x), min=min(x), max=max(x)))

# Boxplots and Histograms
par(mar=c(3, 3, 3, 3))
par(mfrow=c(2,2))  # Set 2x2 layout for plots
boxplot(df$TV, main="Boxplot of TV")
boxplot(df$Radio, main="Boxplot of Radio")
boxplot(df$Newspaper, main="Boxplot of Newspaper")
boxplot(df$Sales, main="Boxplot of Sales")

hist(df$TV, main="Histogram of TV", col="lightblue", breaks=20)
hist(df$Radio, main="Histogram of Radio", col="lightblue", breaks=20)
hist(df$Newspaper, main="Histogram of Newspaper", col="lightblue", breaks=20)
hist(df$Sales, main="Histogram of Sales", col="lightblue", breaks=20)

# Detect potential outliers
boxplot.stats(df$TV)$out
boxplot.stats(df$Radio)$out
boxplot.stats(df$Newspaper)$out
boxplot.stats(df$Sales)$out

# Pair Plots
pairs(df, main="Pairwise Scatterplots")
op <- NULL
par(mfrow=c(1,1))
# 1.7 Correlations Between Predictors
cor_matrix <- cor(df)
print(cor_matrix)  # Correlation matrix

# Correlation between response (Sales) and predictors
cor(df$Sales, df$TV)
cor(df$Sales, df$Radio)
cor(df$Sales, df$Newspaper)

# Questions to answer through linear regression
# 1. Which advertising channel impacts sales the most?
# 2. Does increasing TV ad spend lead to higher sales more effectively than Radio or Newspaper?
# 3. Is there an interaction effect between TV and Radio?
# 4. Do we need transformation for model accuracy?

lm_tv <- lm(Sales ~ TV, data = df)
lm_radio <- lm(Sales ~ Radio, data = df)
lm_newspaper <- lm(Sales ~ Newspaper, data = df)
summary(lm_tv)
summary(lm_radio)
summary(lm_newspaper)

conf_intervals <- confint(lm_tv, level = 0.95)
print(conf_intervals)

conf_intervals <- confint(lm_radio, level = 0.95)
print(conf_intervals)

conf_intervals <- confint(lm_newspaper, level = 0.95)
print(conf_intervals)

par(mfrow=c(1,3))
plot(lm_tv$fitted.values, lm_tv$residuals, main="TV Residuals", xlab="Fitted Values", ylab="Residuals")
abline(h=0, col="blue", lty=2)

plot(lm_radio$fitted.values, lm_radio$residuals, main="Radio Residuals", xlab="Fitted Values", ylab="Residuals")
abline(h=0, col="blue", lty=2)

plot(lm_newspaper$fitted.values, lm_newspaper$residuals, main="Newspaper Residuals", xlab="Fitted Values", ylab="Residuals")
abline(h=0, col="blue", lty=2)

par(mfrow=c(1,1))
hist(lm_tv$residuals, main="Histogram of TV Residuals", col="lightblue", breaks=20)
qqnorm(lm_tv$residuals); qqline(lm_tv$residuals, col="red")

hist(lm_radio$residuals, main="Histogram of Radio Residuals", col="lightblue", breaks=20)
qqnorm(lm_radio$residuals); qqline(lm_radio$residuals, col="red")

hist(lm_newspaper$residuals, main="Histogram of Newspaper Residuals", col="lightblue", breaks=20)
qqnorm(lm_newspaper$residuals); qqline(lm_newspaper$residuals, col="red")


#  Full model with all predictors
model_full <- lm(Sales ~ TV + Radio + Newspaper, data=df)
conf_intervals <- confint(model_full, level = 0.95)
print(conf_intervals)
#  Model Summary & Interpretation
summary(model_full)  # Get coefficients, p-values, R-squared

# Visualizing simple linear regression (TV vs Sales)
plot(df$TV, df$Sales, main="TV vs Sales", xlab="TV Ad Spend", ylab="Sales", pch=19)
abline(lm(Sales ~ TV, data=df), col="red", lwd=2)

plot(df$Radio, df$Sales, main="Radio vs Sales", xlab="Radio Ad Spend", ylab="Sales", pch=19)
abline(lm(Sales ~ Radio, data=df), col="red", lwd=2)

plot(df$Newspaper, df$Sales, main="Newspaper vs Sales", xlab="Newspaper Ad Spend", ylab="Sales", pch=19)
abline(lm(Sales ~ Newspaper, data=df), col="red", lwd=2)

library(scatterplot3d)

# Create a 3D scatter plot with regression plane
s3d <- scatterplot3d(df$TV, df$Radio, df$Sales,
                     pch = 16,
                     color = "red",
                     main = "Multiple Linear Regression",
                     xlab = "TV",
                     ylab = "Radio",
                     zlab = "Sales"
                    )

# Fit the multiple linear regression model
model_full <- lm(Sales ~ TV + Radio, data = df)

# Predict values for a regression plane
grid <- expand.grid(TV = seq(min(df$TV), max(df$TV), length = 20),
                    Radio = seq(min(df$Radio), max(df$Radio), length = 20))
grid$Sales <- predict(model_full, newdata = grid)

# Add regression plane
s3d$plane3d(model_full, col = "blue", lty = "dotted")



# Reduced Model (Removing Newspaper since it's not significant)
model_reduced <- lm(Sales ~ TV + Radio, data=df)
summary(model_reduced)

conf_intervals <- confint(model_reduced, level = 0.95)
print(conf_intervals)
# Create 3D scatter plot for the reduced model (without Newspaper)
s3d <- scatterplot3d(df$TV, df$Radio, df$Sales,
                     pch = 16, color = "red",
                     main = "3D Scatter Plot: Sales vs TV & Radio",
                     xlab = "TV", ylab = "Radio", zlab = "Sales")

# Add regression plane for the reduced model
s3d$plane3d(model_reduced, col = "blue", lty = "dotted")


# Compare AIC and BIC for best model selection
AIC(model_full, model_reduced)
BIC(model_full, model_reduced)

# Tarnsformations
df$log_Sales <- log(df$Sales)
df$sqrt_Sales <- sqrt(df$Sales)

lm_log <- lm(log_Sales ~ TV + Radio + Newspaper, data=df)
lm_sqrt <- lm(sqrt_Sales ~ TV + Radio + Newspaper, data=df)

summary(lm_log)
summary(lm_sqrt)

AIC(model_full, model_reduced, lm_log)
BIC(model_full, model_reduced, lm_log)
AIC(model_full, model_reduced, lm_sqrt)
BIC(model_full, model_reduced, lm_sqrt)

cor_matrix <- cor(df)
print(cor_matrix)
