import numpy as np
from my_ml_library.models import SimpleLinearRegression
from my_ml_library.metrics import mean_squared_error, r2_score

# Data
X = np.array([[1], [2], [3], [4], [5]])
y = np.array([2, 4, 6, 8, 10])

# Model
model = SimpleLinearRegression()
model.fit(X, y)
predictions = model.predict(X)

print("Predictions:", predictions)
print("MSE:", mean_squared_error(y, predictions))
print("R2 Score:", r2_score(y, predictions))
