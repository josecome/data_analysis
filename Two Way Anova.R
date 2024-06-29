#==========================================Two Way Anova=====================================================================

# Importing library
library(car)

# Attach the data make it ease to call later
attach(iris)

iris$level <- c('low', 'high')

# Display the Histogram
hist(iris$Sepal.Width)

# Test of Noarmality
shapiro.test(iris$Sepal.Width)

# The Shapiro-Wilk test shows a p-value of 0.10, which is greater than 0.05, suggesting that the data is normally distributed. 
# If it’s less than 0.05, then the data is not normal distribuited.

# Testing Variances
lm.iris1<-lm(Sepal.Width~Species*level,data=iris)
leveneTest(lm.iris1)
# The variances are equal, as the p-value is 0.556 (greater than 0.05). This dataset satisfies the assumptions of equality or similarity of variance, ANOVA can be ran!
  
# Running the two-way ANOVA
anova(lm.iris1)
# There is at least one group that is significantly different (p is super small: p< 2.2 x 10^-16).

# Display the Summary of Anova
summary(lm.iris1)

# Summary of anova table
# Species:level row. The farthest right column (Pr(>F)) shows a p-value of 0.42, the interaction of the 2 variables is not significant.
# In the level row, we see a p-value of 0.81 - level does not have a significant effect on sepal width.
# Species has a super small p-value (less than 2 X 10^-16), it means that it has a significant effect on sepal width.

# Post-hoc Multiple Comparisons
# The only signicant factor was Species, this post-hoc comparison will be as follow
iris1.aov<-aov(Sepal.Width~Species,data=iris)
TukeyHSD(iris1.aov)
# Actual difference between the means under diff and the adjusted p-value (p adj) for each pairwise comparison

# If there was significant interaction of Species*level the code would be as follow
iris2.aov<-aov(Sepal.Width~Species*level,data=iris)
TukeyHSD(iris2.aov)