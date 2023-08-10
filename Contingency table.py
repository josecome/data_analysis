# Table of Contigency
# Contingency table also known as cross tabulation or crosstab is a tabular mechanism 
# in matrix format that display multivariate frequency distribution of the variables. 
# This table is understood as the relationship between categorical variables.

import numpy as np
import pandas as pd
import matplotlib as plt

# Define a dictionary containing data
data = {'fruit':['Orange', 'Banana', 'Orange', 'Banana'],
        'like':['yes', 'yes', 'no', 'no'],
        'count':[22, 16, 406, 841]
}
 
# Convert the dictionary into DataFrame 
df = pd.DataFrame(data)
print(df)
#     fruit like  count
# 0  Orange  yes     22
# 1  Banana  yes     16
# 2  Orange   no    406
# 3  Banana   no    841

# Displaying information of dataframe
df.info()
# <class 'pandas.core.frame.DataFrame'>
# RangeIndex: 4 entries, 0 to 3
# Data columns (total 3 columns):
#   Column  Non-Null Count  Dtype
# ---  ------  --------------  -----
# 0   fruit   4 non-null      object
# 1   like    4 non-null      object
# 2   count   4 non-null      int64
# dtypes: int64(1), object(2)
# memory usage: 224.0+ bytes

# Displaying data type information
df.dtypes
# fruit    object
# like     object
# count     int64
# dtype: object

#Getting and Displaying Cross Table
df_ctab = pd.crosstab(df['fruit'], data['like'], margins = True)
print(df_ctab)
