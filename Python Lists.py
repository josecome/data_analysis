# Lists
fruits = ['Orange', 'Mango', 'Banana', 'Strawberry', 'Grape']

# Print firt Element
fruits[0]

# Print first 2 elements
fruits[0:2]

# Print elements from the beggining to index 1
fruits[:2]

# Print elements from index 2 to the end
fruits[2:]

# Print every elements
fruits[:]

# Print last element
fruits[-1]

# Print last 2 elements
fruits[-2:]

# Remove first 2 elements
fruits[0:2] = []

# Remove every element in the list
fruits[:] = []

# Length of list
len(fruits)

# Defining a list
fruits = ['Orange', 'Mango', 'Banana', 'Strawberry', 'Grape']

# Defining a list of number
numbers = [1, 2, 3, 4, 5]

# Nesting lists
x = [fruits, numbers]

# Print list
x

# Print first list on the nested list
x[0]

# Print first value from the first list in the nested lits
x[0][1]

# Loop over a list
[x for x in fruits]

# Loop over a list with if condition
[x for x in fruits if x != "Mango"]

# Loop over a list a uppercase every value
[x.upper() for x in fruits]

# Loop over list with if else condition
[x if x != "Banana" else "Orange" for x in fruits]

# Sort list
fruits.sort()

# Sort reverse a list
fruits.sort(reverse = True)

# Using zip function on lists
for n, f in zip(numbers, fruits): print('Number: {}, Fruit: {}'.format(n, f))