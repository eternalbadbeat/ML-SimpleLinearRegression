#Data Preprocessing

#Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd


#Importing dataset
dataset = pd.read_csv('Salary_Data.csv')

X = dataset.iloc[:, 0].values
Y = dataset.iloc[:, 1].values

#Splitting dataset to training set and test set 
from sklearn.model_selection import train_test_split
X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size = 1/3, random_state = 0)

#feature scaling 
"""from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test) """

X_train = X_train.reshape(-1, 1)

Y_train = Y_train.reshape(-1, 1)

X_test = X_test.reshape(-1, 1)

#Fitting Simple Linear Regression to the Training Set 
#используем библиотеку linear_model 
from sklearn.linear_model import LinearRegression
#создаем модель линейной регрессии
regressor = LinearRegression()
#применяем модель к training_set, обучаем машину на наших примерах
#при использование fit ниже наша модель изучает зависимости между Х и У
regressor.fit(X_train, Y_train)

#Predicting the test set results 
#y_pred - вектор предсказаний зависимой переменной 
y_pred = regressor.predict(X_test)

#Visualising the training set 
plt.scatter(X_train, Y_train, color = 'red' )
plt.plot(X_train, regressor.predict(X_train), color = 'green' )
plt.title('Salary VS Experience(Training Set)')
plt.xlabel('Years of Experience')
plt.ylabel('Salary')
plt.show()



#Visualising the test set 
plt.scatter(X_test, Y_test, color = 'red' )
plt.plot(X_train, regressor.predict(X_train), color = 'green' )
plt.title('Salary VS Experience(Test Set)')
plt.xlabel('Years of Experience')
plt.ylabel('Salary')
plt.show()









