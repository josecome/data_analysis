
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


def fnc(p):
  print("This is: " + p)


#Function with parameters
fnc("A")

#One line function
w = lambda z : z + 10
print(w(4))

#Example of function from python
x = len(ary)

#Loop in array
for x in ary:
  print(x)


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


#Inheritance
class Country:
 def __init__(self, name, pop_number):
  self.name = name
  self.pop_number = pop_number

  def printcnty(self):
    print(self.name, self.pop_number)

class Country_data(Country):
  pass

x = Country_data("Mozambique", 20000)
x.printcnty()

