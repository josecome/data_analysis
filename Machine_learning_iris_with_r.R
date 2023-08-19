#Loading libraries
library(caret)
library(psych)
library(ggvis)
library(gmodels)
library(datasets)


#Getting dataframe
df <- iris

#Loading dataframe from local computer
#rd <- read.csv("Path where the CSV file is stored\iris.csv", header = TRUE,stringsAsFactors=FALSE,na.strings="")

#Inspecting the data
#First 5 records and summary
head(df, 5)
summary(df)


#Run some descriptive statistics

# Box and Whisker plots

#CatterSplot
df %>% ggvis(~Sepal.Length, ~Sepal.Width, fill = ~df$Species) %>% layer_points()
df %>% ggvis(~Sepal.Length, ~Petal.Length, fill = ~df$Species) %>% layer_points()
df %>% ggvis(~Sepal.Length, ~Petal.Width, fill = ~df$Species) %>% layer_points()
df %>% ggvis(~Sepal.Width, ~Petal.Length, fill = ~df$Species) %>% layer_points()
df %>% ggvis(~Sepal.Width, ~Petal.Width, fill = ~df$Species) %>% layer_points()
df %>% ggvis(~Petal.Length, ~Petal.Width, fill = ~df$Species) %>% layer_points()

#Load boxplot
x <- df[,1:4]
y <- df[,5]
# boxplot for each attribute on one image
par(mfrow=c(1,4))
   for(i in 1:4) {
   boxplot(x[,i], main=names(df)[i])
   }

# Basic Scatterplot Matrix
pairs(~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width,data=df, main="Simple Scatterplot Matrix")


#Matrix
pairs.panels(df[,-5], 
              method = "pearson", # correlation method
              hist.col = "#00AFBB",
              density = TRUE,  # show density plots
              ellipses = FALSE # show correlation ellipses
              )

# Create index to split based on labels  
indx <- createDataPartition(df$Species, p=0.80, list=FALSE)

# Subset training set with index
ds.training <- df[indx,]

# Subset test set with index
ds.test <- df[-indx,]

#Multiple model test dataset
dataset <- ds.training
validation <- ds.test

#Start of trainning 5 models
# Run algorithms using 10-fold cross validation repeat 3 times
#control <- trainControl(method="cv", number=10)
control <- trainControl(method="repeatedcv", number=10,  repeats=3)
metric <- "Accuracy"

set.seed(7)
fit.lda <- train(Species~., data=dataset, method="lda", metric=metric, trControl=control)
fit.cart <- train(Species~., data=dataset, method="rpart", metric=metric, trControl=control)
fit.knn <- train(Species~., data=dataset, method="knn", metric=metric, trControl=control)
fit.svm <- train(Species~., data=dataset, method="svmRadial", metric=metric, trControl=control)
fit.rf <- train(Species~., data=dataset, method="rf", metric=metric, trControl=control)

#Start of validadte the best models
#Summarizing accuracy of models
results <- resamples(list(lda=fit.lda, cart=fit.cart, knn=fit.knn, svm=fit.svm, rf=fit.rf))

#Summary
summary(results)

# comparing accuracy of models
dotplot(results)

# summarize Best Model
print(fit.rf)

#Predict using one of the five model

# Estimate skill of LDA on the validation dataset
predictions <- predict(fit.rf, validation)

#See the accuray
confusionMatrix(table(predictions, validation$Species))

#Save model for later use

# save the model to disk
saveRDS(model_knn, "./iris_ml_model.rds")

# load the model
super_model <- readRDS("./iris_ml_model.rds")





 




















