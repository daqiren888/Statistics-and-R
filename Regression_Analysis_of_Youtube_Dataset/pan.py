import pandas as pd
from io import StringIO

df = pd.read_csv("v0.csv", sep='')

df2 = df[['age', 'rate', 'views', 'length', 'ratings']]


df2.to_csv('k0.csv')

print(df2)

#df[df.1.apply(lambda x: x.isnumeric())]
