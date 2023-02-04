import pandas as pd

#Dataframe from csv file
df = pd.read_csv('data.csv')

print(df) 

#Data
d = {
  "age": [18, 22, 24, 54],
  "gender": ["M", "M", "F", "F"]
}

#Convert data to dataframe
df = pd.DataFrame(d)


df.head()

print(df) 

#Add id for each row of dataframe
df = pd.DataFrame(d, index = [1, 2, 3, 4])

#Set name to index column
df.index.name = 'Order'

# shift column 'gender' to second position
df = df.iloc[:, [1,0]].copy()

#Row index:
print(df.iloc[0])


#Select first and second row by indexes:
print(df.iloc[[0, 1]])

#Update row by index
df.at[1, 'age']='40'

#Update dataframe from 0 to 2 in column age and gender
df.loc[0:2,['age','gender']] = [80,'M']

#Replace values in dataframe
df.replace("F", "M", inplace=True)

#Subset dataframe

#Create other dataframe with some columns from other
df.iloc[:,[0]] #Can be 0,1,...

#With range
df.iloc[:, 0:1]

#Select rows that value in column age = 80
df.loc[df['age'] == 80]

#Select rows based in two condition
df.loc[(df['age'] > 79) & (df['age'] < 100) & (df['gender'] == "M")]