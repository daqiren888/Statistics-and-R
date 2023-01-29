import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.linear_model import Ridge


df = pd.read_csv("g3.csv")

print(df)

X = df['disb']
y = df['general_votes']

X_train,X_test,y_train,y_test = train_test_split(X,y,test_size=0.25,random_state=0)  #in this case, you may choose to set the test_size=0. You should get the same prediction here

logistic_regression= LogisticRegression()
logistic_regression.fit(X_train,y_train)

'''
df2 = pd.read_csv('d2.csv', skiprows=1000000, nrows=999999)
      
df2 = pd.DataFrame(df, columns= ["general_votes","disb","can_party"])

#ew_candidates,columns= ['gmat', 'gpa','work_experience'])
y_pred=logistic_regression.predict(df2)

print (df2)
print (y_pred)
'''
