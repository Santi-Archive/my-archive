import pandas as pd
from sklearn import linear_model

df = pd.read_csv("NU/Project/data.csv")

X = df[['Weight', 'Volume']]
y = df['CO2']

regr = linear_model.LinearRegression()
regr.fit(X, y)

predictedC02 = regr.predict([[3300, 1300]])
print(predictedC02)
print(regr.coef_)