# Python write and read file

x = "Testing..."
# writing to file
f = open('myf.txt', 'w')
f.writelines(x)
f.close()

# Using readlines()
f = open('myf.txt', 'r')
L = f.readlines()

count = 0
# Strips the newline character
for l in L:
	c += 1
	print("Line{}: {}".format(c, l.strip()))
