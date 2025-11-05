import numpy as np
import matplotlib.pyplot as plt
from sklearn.datasets import load_iris
from sklearn.preprocessing import OneHotEncoder
from sklearn.metrics import confusion_matrix, accuracy_score

# -------------------------------
# Step 1: Load and preprocess data
# -------------------------------
iris = load_iris()
X = iris.data   # shape (150, 4)
y = iris.target.reshape(-1, 1)  # shape (150, 1)

# Normalize features
X = (X - X.mean(axis=0)) / X.std(axis=0)

# One-hot encode labels
encoder = OneHotEncoder(sparse_output=False)
y_onehot = encoder.fit_transform(y)  # shape (150, 3)

n_samples, n_features = X.shape
n_classes = y_onehot.shape[1]

# -------------------------------
# Step 2: Initialize parameters
# -------------------------------
np.random.seed(42)
W = np.random.randn(n_features, n_classes) * 0.01
b = np.zeros((1, n_classes))

# -------------------------------
# Step 3: Define helper functions
# -------------------------------
def softmax(z):
    """Compute softmax probabilities"""
    exp_z = np.exp(z - np.max(z, axis=1, keepdims=True))  # stability
    return exp_z / np.sum(exp_z, axis=1, keepdims=True)

def cross_entropy(y_true, y_pred):
    """Compute cross-entropy loss"""
    eps = 1e-9
    y_pred = np.clip(y_pred, eps, 1 - eps)
    return -np.mean(np.sum(y_true * np.log(y_pred), axis=1))

def forward(X, W, b):
    """Forward pass: compute logits and predictions"""
    logits = np.dot(X, W) + b
    y_pred = softmax(logits)
    return y_pred

def backward(X, y_true, y_pred):
    """Compute gradients for W and b"""
    n = X.shape[0]
    dW = np.dot(X.T, (y_pred - y_true)) / n
    db = np.sum(y_pred - y_true, axis=0, keepdims=True) / n
    return dW, db

# -------------------------------
# Step 4: Training loop
# -------------------------------
lr = 0.1
epochs = 1000
losses = []

for epoch in range(epochs):
    # forward pass
    y_pred = forward(X, W, b)
    loss = cross_entropy(y_onehot, y_pred)
    losses.append(loss)

    # backward pass
    dW, db = backward(X, y_onehot, y_pred)

    # update parameters
    W -= lr * dW
    b -= lr * db

    # print progress
    if epoch % 50 == 0:
        print(f"Epoch {epoch}: Loss = {loss:.4f}")

# -------------------------------
# Step 5: Evaluation
# -------------------------------
y_pred_labels = np.argmax(y_pred, axis=1)
y_true_labels = y.flatten()

accuracy = accuracy_score(y_true_labels, y_pred_labels)
print("\nFinal Training Accuracy:", accuracy)

conf_matrix = confusion_matrix(y_true_labels, y_pred_labels)
print("\nConfusion Matrix:\n", conf_matrix)

# -------------------------------
# Step 6: Plot Loss Curve
# -------------------------------
plt.plot(losses)
plt.xlabel("Epochs")
plt.ylabel("Loss")
plt.title("Loss vs Epochs")
plt.show()
