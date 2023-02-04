#Functions

#To get min from array
x = min(4, 8, 60)

#To get max from array
y = max(4, 8, 60)

#To get absolute number
x = abs(-6)

#2 Power of 8
x = pow(8, 2)

#Some math functions

#To be able to use math functions, we have to import math
import math

#Square of number
x = math.sqrt(4)
print(x)

#Round up
x = math.ceil(2.2)

#Round down
y = math.floor(2.2)

#Pi value (3.14...)
x = math.pi

print(x)

#Using numpy functions
import numpy

a = [1,2,3,4,5,6,7,8]

#Get mean from array
x = numpy.mean(a)

print(x)

#Get media form array
x = numpy.median(a)

print(x)

#Standard desviation from array
x = numpy.std(a)

print(x)

#Percentil
x = numpy.percentile(a, 90)

print(x)

#Using stats functions
from scipy import stats

x = stats.mode(a)

print(x)
