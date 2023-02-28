# Load the data into a data frame
df <- read.csv("/data.csv")

# Print first 7 rows of the dataframe
head(df)

#Return number of rows
nrow(df)


# Remove missing values
#Option 1
df <- na.omit(df) 

#Option 2
df <- df[complete.cases(df),]

# Remove duplicate rows
df <- df[!duplicated(df),]

# Remove duplicate records by id
df <- df[!duplicated(df$id),]

# Transform variables to the correct data type
df[2:5] <- sapply(df[2:5],as.numeric)

# Replace outliers by media value in specific column
median <- median(df$col_1, na.rm = TRUE)
df$col_1[df$col_1 > 3 * median] <- median

# Export file in csv format
# write.csv(df, "cleaned_data.csv")

