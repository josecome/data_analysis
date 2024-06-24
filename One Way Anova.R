#==========================================One Way Anova=====================================================================

#Importing library
library(car)

# Attach the data make it ease to call later
attach(iris)

#Display the Histogram
hist(iris$Sepal.Width)

# Test of Noarmality
shapiro.test(iris$Sepal.Width)

# The Shapiro-Wilk test shows a p-value of 0.10, which is greater than 0.05, suggesting that the data is normally distributed. 
# If it’s less than 0.05, then the data is not normal distribuited.

# Testing Variances
lm.iris1<-lm(Sepal.Width~Species,data=iris)
leveneTest(lm.iris1)

# The variances are equal, as the p-value is 0.556 (greater than 0.05). This dataset satisfies the assumptions, ANOVA can be ran!
  
# Running the one-way ANOVA
anova(lm.iris1)
# There is at least one group that is significantly different (p is super small: p< 2.2 x 10^-16).

# Display the Summary of Anova
summary(lm.iris1)


# Post-hoc Multiple Comparisons
# Tukey HSD is the follow up to one-way ANOVA, when the F-test has revealed the existence of a significant difference between groups
iris.aov<-aov(Sepal.Width~Species,data=iris)
TukeyHSD(iris.aov)

# Actual difference between the means under diff and the adjusted p-value (p adj) for each pairwise comparison
