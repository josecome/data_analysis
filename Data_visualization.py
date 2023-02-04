import matplotlib.pyplot as plt
import numpy as np


#Draw a line in a diagram from position (0,0) to position (6,250):

import matplotlib.pyplot as plt

#Draw lines in follow coordinates: (0, 0) and (4, 60)
xpnts = np.array([0, 4])
ypnts = np.array([0, 60])

plt.plot(xpnts, ypnts)
plt.show()

#Draw points
plt.plot(xpnts, ypnts, 'o')
plt.show()

#Line chart
xpnts = np.array([1, 2, 3, 4])
ypnts = np.array([6, 2, 20, 12])

plt.plot(xpnts, ypnts)
plt.show()

#If we do not include xpnts by default will be by position of element in array
plt.plot(ypnts)
plt.show()

#Line chart with point
plt.plot(ypnts, marker = 'o')
plt.show()

#Line chart in dot alternating to dash "linestyle = 'dashed'"
plt.plot(ypnts, linestyle = 'dotted')
plt.show()

#Chart line with color
plt.plot(ypnts, color = 'b')
plt.show()


#Specifying with of line
plt.plot(ypnts, linewidth = '20.5')
plt.show()

#Chart with multiple line
y1 = np.array([1, 2, 3, 4])
y2 = np.array([6, 2, 20, 12])

plt.plot(y1)
plt.plot(y2)

plt.show()


#Grid: vertical line
plt.grid(axis = 'x')

#Subplot
#plot 1:
x = np.array([1, 2, 3, 4])
y = np.array([6, 2, 20, 12])

plt.subplot(1, 2, 1)
plt.plot(x,y)

#plot 2:
x = np.array([1, 2, 3, 4])
y = np.array([6, 2, 20, 12])

plt.subplot(1, 2, 2)
plt.plot(x,y)

plt.show()


#Scatter plot
x = np.array([9,4,1,3,8,9,7,2,9,6,5,9,6,5,4,8,2])
y = np.array([3,8,7,4,6,7,4,2,0,3,8,2,7,4,9,8,4])

plt.scatter(x, y)
plt.show()

#Specifyin color
plt.scatter(x, y, color = 'hotpink')
plt.show()


clrs = np.array([9,4,1,3,8,9,7,2,9,6,5,9,6,5,4,8,2])

plt.scatter(x, y, c=clrs, cmap='viridis')

plt.colorbar()

plt.show()


x = ["A", "B"]
y = [240, 420]
plt.bar(x, y)

#Bar in horizontal
plt.barh(x, y)
plt.show()

#Define color to the bar
plt.bar(x, y, color = "green")
plt.show()

#Define height of horizontal bar
plt.barh(x, y, height = 0.1)
plt.show()

#Histogram
plt.hist(y)
plt.show() 

#Pie
plt.pie(y)
plt.show() 

#Pie with labels

lbls = x
plt.pie(y, labels = lbls)
plt.show() 

#Other examples
plt.pie(y, labels = lbls, startangle = 90)
plt.show() 

epd = [0.4, 0]

plt.pie(y, labels = lbls, explode = epd)
plt.show() 

plt.pie(y, labels = lbls, explode = epd, shadow = True)
plt.show() 

clrs = ["black", "hotpink", "b", "#4CAF50"]

plt.pie(y, labels = lbls, colors = clrs)
plt.show() 

plt.pie(y, labels = lbls)
plt.legend()
plt.show() 

plt.pie(y, labels = lbls)
plt.legend(title = "Four Fruits:")
plt.show() 
