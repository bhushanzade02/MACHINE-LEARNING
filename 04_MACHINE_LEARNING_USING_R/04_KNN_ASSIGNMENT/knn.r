# Load libraries
library(class)
library(ggplot2)
library(caret)  # For confusion matrix

# Load dataset
data(iris)
set.seed(123)

# Select features and labels
x <- iris[, c("Sepal.Width", "Petal.Width")]
y <- iris$Species

# Train-test split
tr.idx <- sample(1:nrow(iris), 0.7 * nrow(iris))
tr.x <- as.matrix(x[tr.idx, ])
tr.y <- as.factor(y[tr.idx])
ts.x <- as.matrix(x[-tr.idx, ])
ts.y <- y[-tr.idx]

# Generate grid points
gx <- seq(min(x[,1]), max(x[,1]), length.out=100)
gy <- seq(min(x[,2]), max(x[,2]), length.out=100)
g <- expand.grid(Sepal.Width=gx, Petal.Width=gy)

# k values
k.vals <- c(1, 5, 9, 13, 17, 21, 25, 29)

# Fast k-NN function
knn.cls <- function(g, tr.x, tr.y, k) apply(as.matrix(dist(rbind(g, tr.x)))[1:nrow(g), (nrow(g) + 1):nrow(rbind(g, tr.x))], 1, function(d) names(sort(table(tr.y[order(d)[1:k]]), decreasing=TRUE))[1])

# Store k-NN predictions for decision boundaries
pds <- do.call(rbind, lapply(k.vals, function(k) data.frame(g, K=factor(k), Species=as.factor(knn.cls(g, tr.x, tr.y, k)))))

#DECISOION BOUNDARY
ggplot(pds, aes(Sepal.Width, Petal.Width, fill=Species)) + geom_tile(alpha=0.3) + geom_point(data=iris, aes(color=Species), size=2) + facet_wrap(~K) + theme_minimal() + labs(title="k-NN Boundaries", x="Sepal W", y="Petal W")


#CONFUSION MATRICS
conf_data <- do.call(rbind, lapply(k.vals, function(k) { pred <- knn(tr.x, ts.x, tr.y, k); cm <- table(Predicted=pred, Actual=ts.y); acc <- sum(diag(cm)) / sum(cm) * 100; df <- as.data.frame(as.table(cm)); df$K <- factor(k); df$Accuracy <- acc; df }))


#plot confusion Metrics
ggplot(conf_data, aes(Actual, Predicted, fill=Freq)) + geom_tile() + geom_text(aes(label=Freq), color="white", size=5) + facet_wrap(~K) + scale_fill_gradient(low="blue", high="red") + theme_minimal() + labs(title="Confusion Matrices for Different K", x="Actual", y="Predicted")
