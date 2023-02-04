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

