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
library(readr)
library(car)
library(ggplot2)

# Directory path
dir <- "C:/Users/COME/Downloads/Master Degree/Coding/Analisis/Data Analisis/data_analysis_r/"

# Set working directory
setwd(dir)

df <- read_csv("incomes.csv")
View(df)
attach(df)


# Rename columns in dataset
colnames(df) <- c('order','category','sex','income')

# Format variables
df$order <- as.numeric(df$order)
df$category <- as.factor(df$category)
df$sex <- as.factor(df$sex)
df$income <- as.numeric(df$income)

# Display income distribuition chart (histogram)
win.graph()
par(mfrow=c(1,2))
hist(df$income,freq = F)
curve(dnorm(x,mean(df$income),sd(df$income)),add=T)
shapiro.test(df$income)


#  Display income distribuition Boxplot 
boxplot(df$income)

# split data set by sex
m = df[sex="M"]
f = df[sex="F"]

# Testing hypothesis at a 95% confidence level, that male staff income are similarly to female staff
t.test(m[,"income"],f[,"income"],conf.level = 0.95)

# Parametric test for income 
df2 <- cbind(m[,"income"],f[,"income"])

# Chi-square test
chisq.test(df2)

# Testing hypothesis at a 95% confidence level, that male staff income are similarly to female staff

#Anova test
mdl <- aov(formula = income ~ category, data = df)

# Print result
mdl

# Print summary
summary(mdl)

# ================Let's check if some assumptions are met=====================
# Homogeneity
leveneTest(income ~ category, data = df)

# Normality of residues
shapiro.test(resid(mdl))

# Pair-wise comparison of averages
TukeyHSD(mdl)


# Non parametric test for income  
kruskal.test(category, income, data = df, conf.level = 0.95)
