import numpy as np

class SimpleLinearRegression:
    def __init__(self):
        self.slope = None
        self.intercept = None

    def fit(self, X, y):
        X = np.array(X).flatten()
        y = np.array(y)
        x_mean = np.mean(X)
        y_mean = np.mean(y)

        self.slope = np.sum((X - x_mean) * (y - y_mean)) / np.sum((X - x_mean) ** 2)
        self.intercept = y_mean - self.slope * x_mean

    def predict(self, X):
        X = np.array(X).flatten()
        return self.slope * X + self.intercept

class MultipleLinearRegression:
    def __init__(self):
        self.coefficients = None

    def fit(self, X, y):
        X = np.column_stack((np.ones(X.shape[0]), X))
        self.coefficients = np.linalg.inv(X.T @ X) @ X.T @ y

    def predict(self, X):
        X = np.column_stack((np.ones(X.shape[0]), X))
        return X @ self.coefficients

class LogisticRegression:
    def __init__(self, learning_rate=0.01, iterations=1000):
        self.learning_rate = learning_rate
        self.iterations = iterations
        self.weights = None
        self.bias = None

    def sigmoid(self, z):
        return 1 / (1 + np.exp(-z))

    def fit(self, X, y):
        n_samples, n_features = X.shape
        self.weights = np.zeros(n_features)
        self.bias = 0

        for _ in range(self.iterations):
            linear_model = np.dot(X, self.weights) + self.bias
            predictions = self.sigmoid(linear_model)

            dw = (1 / n_samples) * np.dot(X.T, (predictions - y))
            db = (1 / n_samples) * np.sum(predictions - y)

            self.weights -= self.learning_rate * dw
            self.bias -= self.learning_rate * db

    def predict(self, X):
        linear_model = np.dot(X, self.weights) + self.bias
        predictions = self.sigmoid(linear_model)
        return np.round(predictions)



class RidgeRegression:
    def __init__(self, alpha=1.0):
        self.alpha = alpha
        self.coefficients = None

    def fit(self, X, y):
        X = np.column_stack((np.ones(X.shape[0]), X))
        n_features = X.shape[1]
        identity = np.eye(n_features)
        identity[0, 0] = 0  # Don't regularize the bias term
        self.coefficients = np.linalg.inv(X.T @ X + self.alpha * identity) @ X.T @ y

    def predict(self, X):
        X = np.column_stack((np.ones(X.shape[0]), X))
        return X @ self.coefficients

class LassoRegression:
    def __init__(self, alpha=1.0, iterations=1000, learning_rate=0.01):
        self.alpha = alpha
        self.iterations = iterations
        self.learning_rate = learning_rate
        self.coefficients = None

    def fit(self, X, y):
        X = np.column_stack((np.ones(X.shape[0]), X))
        n_samples, n_features = X.shape
        self.coefficients = np.zeros(n_features)

        for _ in range(self.iterations):
            y_pred = X @ self.coefficients
            error = y_pred - y
            gradient = (X.T @ error) / n_samples
            self.coefficients -= self.learning_rate * gradient
            self.coefficients[1:] -= self.learning_rate * self.alpha * np.sign(self.coefficients[1:])

    def predict(self, X):
        X = np.column_stack((np.ones(X.shape[0]), X))
        return X @ self.coefficients
