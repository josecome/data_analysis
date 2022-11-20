#R base charts

#Chart of sin from -10 to 10
#To have subtilte add sub option
#sub = "Subtitle"
#Colors in titles
#col.main = "blue",   # Title color
#col.sub = "orange" #Subtitle color
curve(sin, -10 , 10,
      main = "Sin chart")

#Histogram
x = c(8,3,2,6,2,6,6,8)
hist(x, main = "Histogram")

#Boxplot
boxplot(x, main = "BoxPlot")

#Pie
pie(table(round(x)), main = "Pie")

#Painel with multiple chart
#One row, two columns
par(mfrow = c(1, 2))
hist(x, main = "Histogram")
boxplot(x, main = "BoxPlot")

#Back to default
par(mfrow = c(1, 1))

#Barplot with optionsr
barplot(x, xlab = "Barplot",
        ylab = "Count", 
        col = "blue",
        col.axis = "green",
        col.lab = "black"
)

#Pie with options
pie(x, labels = names(x), 
    col = "green",
    main = "Pie with options", 
    radius = -1,
    col.main = "blue"
)

#Histogram with options
hist(x, main = "Histogram with options",
xlab = "X",
col.lab = "blue",
col.main = "yellow"
)

#Histogram with normal distribution curve
win.graph() #This function will open chart in new window instead rstudio Plot painel
hist(x,freq = F)
curve(dnorm(x,mean(x),sd(x)),add=T)

x = c(1,2,3,4,5,6,7,8)
y = c(8,3,2,6,2,6,6,8)
#Plot with options
plot(x = x, 
     y = y, 
     xlab = "x vlaues",
     ylab = "Line", 
     main = "Plotting data",
     col.lab = "blue", 
     col.main = "red",
     col.axis = "yellow"
)

#Library for 3D Pie Chart
library(plotrix)
#3D Pie
pie3D(x, labels = names(x), 
      col = "green",
      main = "Pie with options", 
      radius = -1,
      col.main = "blue"
)

#To save chart in file
png(file = "chart.png")
hist(x, main = "Histogram") #Example
dev.off()









