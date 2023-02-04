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
