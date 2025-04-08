import numpy as np
from my_ml_library.metrics import mean_squared_error, mean_absolute_error, r2_score

def test_mean_squared_error():
    y_true = [3, -0.5, 2, 7]
    y_pred = [2.5, 0.0, 2, 8]
    assert np.isclose(mean_squared_error(y_true, y_pred), 0.375)

def test_r2_score():
    y_true = [3, -0.5, 2, 7]
    y_pred = [2.5, 0.0, 2, 8]
    assert np.isclose(r2_score(y_true, y_pred), 0.9486, atol=1e-4)
