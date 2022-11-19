#Dataframe from csv file
df = read.csv("incomes.csv")

print(df) 

#Data
age <- c(18, 22, 24, 54)
gender <- c("M", "M", "F", "F")

#Convert data to dataframe
df = data.frame(age,gender)

#Create vector to include as column in dataframe
order <- c(1, 2, 3, 4)

#Create dataframe from vector
df0 <- data.frame(order)

#Combine dataframes to create other dataframe
df <- cbind(df0, df)

#Print first 4 lines of dataframe
head(df, 4)

#columns names of dataframe
names(df)

#Number of columns
ncol(df)

#Number of rows
nrow(df)

#Create new dataframe from other
df2 <- df

# shift column 'gender' to second position
df = df[,c("order", "gender", "age")]

#Select row by column
df[order == 1,]


#Select row that order is 1 or 2
df[order == 1 | order == 2,]

#Select values of column age
df[, "age"]

#Replace values across entire dataframe
df[df == "F"] <- "M"

#Raplace value in single column
df["gender"][df["gender"] == "M"] <- "F"

#Replace values across entire dataframe
df[df == 4 | df == 8] <- 6

#Raplace value in single column (age)
df["age"][df["age"] == 18] <- 20

#Merge dataframes
#Outer join: all = TRUE, Left outer: all.x = TRUE, Right outer: all.y = TRUE and Cross join: all = NULL
df <- merge(x = df, y = df2, by = "order", all.x = TRUE)