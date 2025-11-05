import pandas as pd 
import numpy as np 
from sklearn.datasets import load_iris
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score, confusion_matrix

# Load dataset
iris = load_iris()
X , y = iris.data, iris.target

# Split into train/test
X_train, X_test , y_train , y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Euclidean distance
def distance(a, b):
    return np.sqrt(np.sum((a - b) ** 2))

# KNN logic
k = 3
pred = []
for j in range(len(X_test)):
    d = []
    for i in range(len(X_train)):
        d.append(distance(X_test[j], X_train[i]))
    
    tmp = y_train[np.argsort(d)[:k]]
    y_pred = pd.Series(tmp).value_counts().index[0]
    pred.append(y_pred)

# Accuracy
acc = accuracy_score(y_test, pred)
print(f"Accuracy Score: {acc}")

# Confusion Matrix
cmf = confusion_matrix(y_test, pred)
print("Confusion Matrix:\n", cmf)
