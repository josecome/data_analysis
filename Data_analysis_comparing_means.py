#Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#Import libraries
import os
import pandas as pd
import numpy as np
from scipy import stats
import matplotlib.pyplot as plt
from scipy.stats import shapiro
import statsmodels.api as sm
from statsmodels.formula.api import ols
from scipy.stats import f_oneway
from scipy.stats import norm
from scipy.stats import chisquare
from statsmodels.stats.multicomp import pairwise_tukeyhsd

# Directory path
dir = "C:/Users/COME/Downloads/Master Degree/Coding/Analisis/Data Analisis/data_analysis_python/"

# Set working directory
os.chdir(dir)

df = pd.read_csv(r'incomes.csv')

df.head()

# Rename columns in dataset
df.columns = ['order','category','sex','income']

#Confirm new columns names
print(df.columns)

# Format variables
df["order"] = df["order"].astype("int64")
df["sex"] = df["sex"].astype("category")
df["category"] = df["category"].astype("category")
df["income"] = df["income"].astype("int64")

# Display income distribuition chart (histogram)
# Fit a normal distribution to
# the data:
# mean and standard deviation
mu, std = norm.fit(df["income"]) 

plt.hist(df["income"], bins=25, density=True, alpha=0.6, color='b')

xmin, xmax = plt.xlim()
x = np.linspace(xmin, xmax, 100)
p = norm.pdf(x, mu, std)
  
plt.plot(x, p, 'k', linewidth=2)
title = "Mean and Std: {:.2f} and {:.2f}".format(mu, std)
plt.title(title)
  
plt.show()

#conduct the  Shapiro-Wilk Test
shapiro(df["income"])

#Display income distribuition Boxplot 
plt.boxplot(df["income"])
plt.show()

# split data set by sex
m = df[df["sex"] == "M"].copy()
f = df[df["sex"] == "F"].copy()

# Testing hypothesis at a 95% confidence level, that male staff income are similarly to female staff
t_value,p_value=stats.ttest_ind(m["income"],f["income"])

print('T value is %f'%float("{:.6f}".format(t_value)))
print('p-value for two tailed test is %f'%p_value)


# Parametric test for income 
frms = [m["income"],f["income"]]
  
df2 = pd.concat(frms, axis=1)
df2.head()

#For training purpose we will set zero for null value
df2 = df2.fillna(0)

# Rename columns in dataset
df2.columns = ['income','income2']

ary = df2[["income","income2"]].to_numpy()

# Chi-square test
chisquare(ary)

# Testing hypothesis at a 95% confidence level, that male staff income are similarly to female staff

#Anova test
fvalue, pvalue = stats.f_oneway(df2['income'], df2['income2'])
print(fvalue, pvalue)

# get ANOVA table as R like output
# Ordinary Least Squares (OLS) model
mdl = ols('income ~ C(category)', data=df).fit()
anova_tbl = sm.stats.anova_lm(mdl, typ=2)

# Print result
anova_tbl 

# ================Let's check if some assumptions are met=====================
# Homogeneity (Equal variances across samples is called homogeneity of variance)

#Levene's test centered at the median
stats.levene(df2['income'], df2['income2'], center='median')

#Levene's test centered at the mean
stats.levene(df2['income'], df2['income2'], center='mean')

#Pair-wise comparison of averages
#perform Tukey's test
tukey = pairwise_tukeyhsd(endog=df['income'],
                          groups=df['sex'],
                          alpha=0.05)

#display results
print(tukey)


#Non parametric test for income  
#Conduct the Kruskal-Wallis Test 
rslt = stats.kruskal(df2['income'], df2['income2'])
  
# Print the result
print(rslt)
