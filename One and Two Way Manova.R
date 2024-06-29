# Importing library
library(car)
library(tidyverse)
library(ggpubr)
library(rstatix)
library(GGally)

# Attach the data make it ease to call later
attach(iris)

# Boxplot
ggboxplot(
  iris, x = "Species", y = c("Sepal.Length", "Petal.Length"), 
  merge = TRUE, palette = "jco"
)

# Statistics
iris %>%
  group_by(Species) %>%
  get_summary_stats(Sepal.Length, Petal.Length, type = "mean_sd")

# Sample size
iris %>%
  group_by(Species) %>%
  summarise(N = n())

# Univariate outliers
iris %>%
  group_by(Species) %>%
  identify_outliers(Sepal.Length)

iris %>%
  group_by(Species) %>%
  identify_outliers(Petal.Length)

# Multivariate outliers
iris %>%
  group_by(Species) %>%
  mahalanobis_distance() %>%
  filter(is.outlier == TRUE) %>%
  as.data.frame()
# No multivariate outliers in the data, Mahalanobis distance (p > 0.001).

# Univariate normality
iris %>%
  group_by(Species) %>%
  shapiro_test(Sepal.Length, Petal.Length) %>%
  arrange(variable)
# Sepal.Length and Petal.length normally distributed for each Species groups, Shapiro-Wilk's test (p > 0.05).

# QQ plot of Sepal.Length
ggqqplot(iris, "Sepal.Length", facet.by = "Species",
         ylab = "Sepal Length", ggtheme = theme_bw())

# QQ plot of Petal.Length
ggqqplot(iris, "Petal.Length", facet.by = "Species",
         ylab = "Petal Length", ggtheme = theme_bw())


# Multivariate normality
iris %>%
  select(Sepal.Length, Petal.Length) %>%
  mshapiro_test()
# With (p > 0.05), can be assumed multivariate normality in data.

# Multicollinearity
iris %>% cor_test(Sepal.Length, Petal.Length)
# No multicollinearity, Pearson correlation (r = 0.87, p < 0.0001).

# Linearity
# Create a scatterplot matrix by group
results <- iris %>%
  select(Sepal.Length, Petal.Length, Species) %>%
  group_by(Species) %>%
  doo(~ggpairs(.) + theme_bw(), result = "plots")
results

# Show the plots
results$plots

# Homogeneity of covariances
box_m(iris[, c("Sepal.Length", "Petal.Length")], iris$Species)
# As (p < 0.001), assumption of homogeneity of variance-covariance matrices as been violated.

# Homogneity of variance
iris %>% 
  gather(key = "variable", value = "value", Sepal.Length, Petal.Length) %>%
  group_by(variable) %>%
  levene_test(value ~ Species)
# No homogeneity of variances as (p < 0.05).

# One way Manova
model <- lm(cbind(Sepal.Length, Petal.Length) ~ Species, iris)
Manova(model, test.statistic = "Pillai")
# Can be seen that there was a statistically significant difference between the Species on the combined dependent variables (Sepal.Length and Petal.Length)
# F(4, 294) = 71.829, p < 0.0001.

# Two way Manova
iris$Level <- c('low', 'high')
model <- lm(cbind(Sepal.Length, Petal.Length) ~ Species * Level , iris)
Manova(model, test.statistic = "Pillai")


















