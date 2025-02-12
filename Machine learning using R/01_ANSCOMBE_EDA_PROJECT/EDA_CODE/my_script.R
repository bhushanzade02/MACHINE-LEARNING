# Load the built-in Anscombe dataset
data <- anscombe
# View the dataset structure
print(data)
str(data)
# Summary of the dataset
summary(data)
# Check data types and structure
str(data)
# Check for missing values
any(is.na(data))
# Plot the datasets side by side
par(mfrow = c(2, 2))  # 2x2 grid for plots
# Plot each dataset
plot(data$x1, data$y1, main = "Dataset 1", xlab = "x1", ylab = "y1", pch = 19)
plot(data$x2, data$y2, main = "Dataset 2", xlab = "x2", ylab = "y2", pch = 19)
plot(data$x3, data$y3, main = "Dataset 3", xlab = "x3", ylab = "y3", pch = 19)
plot(data$x4, data$y4, main = "Dataset 4", xlab = "x4", ylab = "y4", pch = 19)
hist(data$x1, main = "Histogram of x1", xlab = "x1")
hist(data$y1, main = "Histogram of y1", xlab = "y1")
boxplot(data$x1, main = "Boxplot of x1")
boxplot(data$y1, main = "Boxplot of y1")
# Calculate means and variances
mean(data$x1); mean(data$y1)
mean(data$x2); mean(data$y2)
mean(data$x3); mean(data$y3)
mean(data$x4); mean(data$y4)
# Calculate correlations
cor(data$x1, data$y1)
cor(data$x2, data$y2)
cor(data$x3, data$y3)
cor(data$x4, data$y4)
# Reset plotting area
par(mfrow = c(2, 2))
# Fit and plot regression lines
model1 <- lm(y1 ~ x1, data = data)
plot(data$x1, data$y1, main = "Dataset 1 with Regression Line")
abline(model1, col = "red")
model2 <- lm(y2 ~ x2, data = data)
plot(data$x2, data$y2, main = "Dataset 2 with Regression Line")
abline(model2, col = "red")
model3 <- lm(y3 ~ x3, data = data)
plot(data$x3, data$y3, main = "Dataset 3 with Regression Line")
abline(model3, col = "red")
model4 <- lm(y4 ~ x4, data = data)
plot(data$x4, data$y4, main = "Dataset 4 with Regression Line")
abline(model4, col = "red")
summary(model1)
summary(model2)
summary(model3)
summary(model4)
savehistory("D:/20_MACHINE_LEARNING/Machine learning using R/my_script.R")
