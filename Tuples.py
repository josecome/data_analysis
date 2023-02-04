#Empty tpl
tpl = ()
print(tpl)

#tpl with values
tpl1 = ('A', 'B')
print(tpl)

#List in tpl
lst = [1, 2, 3, 4, 5]
print(tuple(lst))

#tpl using a function
tpl = tuple('A', 'B', 'C', 'D')
print(tpl)

#tpl with mixed value
tpl = (2, 4, 'a', 'abc', 8)
print(tpl)

#Combine tpls
tpl1 = (1, 2, 'A')
tpl2 = ('B', 'C')
tpl3 = (tpl1, tpl2)
print(tpl3)

#tpl with repitation
tpl1 = ('A', 'B') * 4
print(tpl1)

#Looping in tpl
tpl = ("A", "B", "C")
for x in tpl:
  print(x)


#Get value by index from Tuplo
print(tpl[0])


#Get multiple value and asign to multiple variables
a, b, c = tpl
print(a)
print(b)
print(c)

#Concatenate tpls
tpl1 = (1, 2, 3, 4, 5)
tpl2 = ('A', 'B', 'C')

tpl3 = tpl1 + tpl2

#Removal of first element
print(tpl1[1:])

#Reversing tpl
print(tpl1[::-1])

#Print elements in range
print(tpl1[4:9])

#Delete tpl
tpl1 = (0, 1, 2, 3, 4)
del tpl1

print(tpl1)

# nested tpl
n_tpl = ("mouse", [8, 4, 6], (1, 2, 3))

# nested index
print(n_tpl[1][0])       # 's'
print(n_tpl[0][2])       # 4

#Negative acessing of elements in tpl
tpl1 = (1, 2, 3, 4, 5, 6, 7, 8)

# Output: 't'
print(tpl1[-2])

# Output: 'p'
print(tpl1[-4])