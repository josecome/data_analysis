library(tidyr)

df <- read.csv('C:/Users/COME/Downloads/Materials/data.csv')
head(df, 2)
#========================Transformation=========================================
df2 <- data.frame(
  df %>%
  pivot_longer(
    cols=c('C1', 'C2', 'C3', 'C4'),
    names_to = "VAR",
    values_to = "VALUES"
  )
)

head(df2, 2)
#=======================End of Transformation===================================
write.csv(df2, "C:/Users/COME/Downloads/Materials/data2.csv")