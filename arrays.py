#Array
ary = ["A", "B", "C"]

x = ary[0] #Value in position one

ary[0] = "D" #Update element in position 1

#Length of ary
x = len(ary)


#Add new value in array
ary.append("E")


#Delete element in position 1
ary.pop(0)

#Delete element with value 'E'
ary.remove("E")

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

#Loop in array
for x in ary:
  print(x)

#Interation with iter function
a = ["a", "b", "c"]
i = iter(a)

print(next(i))
print(next(i))


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

