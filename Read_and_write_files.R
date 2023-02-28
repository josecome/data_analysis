# R write and read file

x # dataframe

#Write csv file
write.csv(x, file = 'incomes.csv')

#Write csv file
write.csv(x, "incomes2.csv")

#Writing to file
con<-file("myf.txt")

#Each item of vector will be wrote in new line
writeLines(c(x), con)
close(con)

#Read csv file
df <- read.csv(file = 'incomes.csv')

#Not having first row as header
df <- read.csv(file = 'incomes.csv', header = FALSE)

##Read csv file
df <- read.csv("incomes.csv")

#read file line by line
f <- "myf.txt"
con <- file(f,open="r")
l <-readLines(con)
for (i in 1:length(l)){
   print(l[i])
}
close(con)