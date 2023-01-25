import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression

df = pd.read_csv("g1.csv",  nrows=750)

#df.loc[df['First Season'] > 1990, 'First Season'] = 1


'''
candidates = {'gmat': [780,750,690,710,680,730,690,720,740,690,610,690,710,680,770,610,580,650,540,590,620,600,550,550,570,670,660,580,650,660,640,620,660,660,680,650,670,580,590,690],
              'gpa': [4,3.9,3.3,3.7,3.9,3.7,2.3,3.3,3.3,1.7,2.7,3.7,3.7,3.3,3.3,3,2.7,3.7,2.7,2.3,3.3,2,2.3,2.7,3,3.3,3.7,2.3,3.7,3.3,3,2.7,4,3.3,3.3,2.3,2.7,3.3,1.7,3.7],
              'work_experience': [3,4,3,5,4,6,1,4,5,1,3,5,6,4,3,1,4,6,2,3,2,1,4,1,2,6,4,2,6,5,1,2,4,6,5,1,2,1,4,5],
              'admitted': [1,1,0,1,0,1,0,1,1,0,0,1,1,0,1,0,0,1,0,0,1,0,0,0,0,1,1,0,1,1,0,0,1,1,1,0,0,0,0,1]
             }

#d1 = pd.DataFrame(df, columns= ["cand_pty_affiliation","general_votes","ttl_disb","can_party","disb","votes"])

'''


print(df)

X = df[['disb', 'can_party']]
y = df[['general_votes']]

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


def classify(X, y, cl, name=''):
    """Classification using gene features"""

    from sklearn.metrics import classification_report, accuracy_score
    np.random.seed()
    ind = np.random.permutation(len(X))

    from sklearn.cross_validation import train_test_split
    Xtrain, Xtest, ytrain, ytest  = train_test_split(X, y, test_size=0.4)
    #print X
    cl.fit(Xtrain, ytrain)
    ypred = cl.predict(Xtest)

    print (classification_report(ytest, ypred))
    #print accuracy_score(ytest, ypred)
    from sklearn import cross_validation
    yl = pd.Categorical(y).labels
    sc = cross_validation.cross_val_score(cl, X, yl, scoring='roc_auc', cv=5)
    print("AUC: %0.2f (+/- %0.2f)" % (sc.mean(), sc.std() * 2))
    return cl 








