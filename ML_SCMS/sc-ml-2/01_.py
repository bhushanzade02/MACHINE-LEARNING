import pandas as pd

data = {
    'Outlook': ['Rainy', 'Rainy', 'Overcast', 'Sunny', 'Sunny', 'Sunny', 'Overcast', 'Rainy', 'Rainy', 'Sunny', 'Rainy', 'Overcast', 'Overcast', 'Sunny'],
    'Temp': ['Hot', 'Hot', 'Hot', 'Mild', 'Cool', 'Cool', 'Cool', 'Mild', 'Cool', 'Mild', 'Mild', 'Mild', 'Hot', 'Mild'],
    'Humidity': ['High', 'High', 'High', 'High', 'Normal', 'Normal', 'Normal', 'High', 'Normal', 'Normal', 'Normal', 'High', 'Normal', 'High'],
    'Windy': ['f', 't', 'f', 'f', 'f', 't', 't', 'f', 'f', 'f', 't', 't', 'f', 't'],
    'Play': ['no', 'no', 'yes', 'yes', 'yes', 'no', 'yes', 'no', 'yes', 'yes', 'yes', 'yes', 'yes', 'no']
}


df = pd.DataFrame(data)
# print(df)

import numpy as np 
import pandas as pd
import matplotlib.pyplot as plt
import math

# partioning data
def pre_processing(df):
    X = df.drop([df.columns[-1]],axis=1)
    y = df.iloc[:,-1]
    
    return X , y



