import pandas as pd
#from io import StringIO

df = pd.read_csv("videos.csv")

print(df)

df2 = df['views','rate','length']

df2.to_csv('k0.csv')

print(df2)

#df[df.1.apply(lambda x: x.isnumeric())]

