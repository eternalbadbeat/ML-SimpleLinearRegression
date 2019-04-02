#Simple Linear Regression 

#Data preprocessing 

#Imoporting the dataset 
dataset = read.csv('Salary_Data.csv')
#dataset = dataset[, 2:3]

#splitting the dataset into the training set and test set
#библиотека для сплита - CaTools
#install.packages('caTools')
#устанавливаем рандомное число для сплита
set.seed(123)

#в питоне нам надо было указывать и матрицу Х и зависимый ветор У, здесь 
#нам надо указать только столбец зависимой переменной 
#в splitrartio мы просто указываем, процент набора данных для тренировки
split = sample.split(dataset$Salary, SplitRatio = 2/3)
#после выполнения строчки сверху, мы получим значение split, которое будет состоять из тру и фолс 
#тру - попадание в трейнинг сет, фолс - в тест сет 

#теперь нам надо отдельно создать тест сет и трейнинг сет
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Fitting Simple Linear Regression to the Training Set 
#formula = зависимая переменная, выраженная, как линейная комбинация независимой переменной 
#в formula мы указали, что зарплата пропорциональная годам опыта
#P-value показывает насколько большое влияние независимая переменная оказывает на зависимую переменную 
# (чем меньше Р-значением, тем больше влияния оказывает независимая переменная)

#Р-значение может пригтдиться при выборе из нескольких независимых переменных
regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)

#Predicting the test set results 
#Y_pred - вектор предсказаний 
#в предикт мы указываем нашу модель и переменную - new_data - те данные, которые мы будем предсказывать
y_pred = predict(regressor, newdata = test_set)

#Visualising the Training set results 
#install.packages('ggplot2')

ggplot()+
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Salary VS Experience (Training set)') +
  xlab('Years of Experience') +
  ylab('Salary')

#Visualising the Test set results
ggplot()+
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Salary VS Experience (Test set)') +
  xlab('Years of Experience') +
  ylab('Salary')


  



