#Change the type of value
x = str(4)    #convert value to string
y = int(4)    #convert value to Integer
z = float(4)  #convert value to Decimal


#Check the type of variable
print(type(x))


#Assign value the multiple variables in line
x, y, z = "A", "B", "C"
print("" + x + y + z)

#Function in python
def myfnc():
  x = "good"
  print("Python is " + x)


#This will call myfnc
myfnc()


#Varibles created outside the function is global. Variables created inside function are local and only accessed inside that function.
#To create global variable inside function use key word 'global'bal Keyword

def myfnc():
  global x
  x = "good"


#Call function
myfnc()

#Function was called, now x can be accessed as global variables
print("Python is " + x)

#Example to see the difference accessing x as local or global variable
x = "nice"

def myfunc():
  global x
  x = "good"
  #print("Python is " + x)


myfnc()

print("Python is " + x)


#If condition
a = 4
b = 6
c = 8
if a < b:
  print("True")

#If condition (AND)
if a > b and c > a:
  print("False")

#If condition (OR)
if a < b or a < c:
  print("True")

#While: loop until the condition is false i = 3
i = 1
while i < 4:
  print(i)
  i += 1


#While: loop but stop if 1 == 2  
i = 1
while i < 4:
  print(i)
  if i == 2:
    break
  i += 1


#Interupt current interation and continue with next
i = 0
while i < 4:
  i += 1
  if i == 2:
    continue
  print(i)  

#Loop but allow change scope when the condition is not meet any more  
i = 1
while i < 4:
  print(i)
  i += 1
else:
  print("i is no longer less than 6")

#Loop from array
a = ["a", "b", ""]
for x in a:
  print(x)

#Loop for each char
for x in "orange":
  print(x)

#Use breack to interrupt loop
a = ["a", "b", "c"]
for x in a:
    break



#Loop in range	
for x in range(2, 8):
  print(x)



#Break if x = 4
for x in range(8):
  if x == 4: break
  print(x)
else:
  print("Finally finished!")


def fnc(p):
  print("This is: " + p)


#Function with parameters
fnc("A")

#One line function
w = lambda z : z + 10
print(w(4))

#Array
ary = ["A", "B", "C"]

x = ary[0] #Value in position one

ary[0] = "D" #Update element in position 1

#Length of ary
x = len(ary)

#Loop in array
for x in ary:
  print(x)

#Interation with iter function
a = ["a", "b", "c"]
i = iter(a)

print(next(i))
print(next(i))

#Add new value in array
ary.append("E")


#Delete element in position 1
ary.pop(0)

#Delete element with value 'E'
ary.remove("E")

#Methos to work with array
#append()	Adds an element at the end of the list
#clear()	Removes all the elements from the list
#copy()	Returns a copy of the list
#count()	Returns the number of elements with the specified value
#extend()	Add the elements of a list (or any iterable), to the end of the current list
#index()	Returns the index of the first element with the specified value
#insert()	Adds an element at the specified position (ary.insert( 1, 'F'))
#pop()	Removes the element at the specified position
#remove()	Removes the first item with the specified value
#reverse()	Reverses the order of the list
#sort()	Sorts the list (ary.sort(reverse=True/False))

#Class
class Country:
 def __init__(self, name, pop_number):
  self.name = name
  self.pop_number = pop_number


 def printcnty(self):
  return str(self.pop_number)


c = Country("Mozambique", 2000000)


print(c.name)
print(c.printcnty())


#To create module write functions and save it with python extension
def my_func_module(n):
  print("Hi, , " + n)


def my_func_module2(n):
  print("Hello, , " + n)



#To access module use import 
import createdmodule

#To use module call it
createdmodule.my_func_module("Jose Come")

#To import in the module only some functions
from createdmodule import my_func_module2

#To work with dates import datetime module
import datetime

#Getting and printing data
x = datetime.datetime.now()
print(x)

#Formating date
print(x.strftime("%A"))

#Convert numbers to date
x = datetime.datetime(2020, 5, 17)

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

#Exceptions

#To throw expection the follow code can be used
try:
  print(x)
except:
  print("An exception occurred")

  
#Multiple exceptions
try:
  print(x)
except TypeError:
  print("Exception 1")
except:
  print("Exception 2")


#Exception with Finally
try:
  print(x)
except:
  print("Exception")
finally:
  print("Finalize by do something")


#Raise exception if number is negative
if x < 0:
  raise Exception("Exception: number must be positive")


#Exception: value has to be number
if not type(x) is int:
  raise TypeError("Exception: value has to be number")


#User input in the console
username = input("Enter username:")
print("Username is: " + username)

#Formanting text
age = 20
t = "The age of Jose is {}"
print(t.format(p))

#Format number to have two decimal
t = "The age of Jose is {:.2f}"


#Multiple format
q = 8
p = 12
t = "The age of Jose is {} and has {:.2f} cars."
print(t.format(q, p))

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
