# Importing library
library(car)

# Attach the data make it ease to call later
attach(iris)

mancova(data = iris,
        deps = vars(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width),
        factors = Species)

# cbind and rbind





















