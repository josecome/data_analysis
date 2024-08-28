# Functions

# Vector
numbers = c(4, 8, 60, 60, 80)

# To get min from array
x = min(numbers)

# To get max from array
y = max(numbers)

# To get absolute number
x = abs(-6)

#2 Power of 8
x = 2^8

# Square of number
x = sqrt(4)
print(x)

# Round up
ceiling(2.2)

# Round down
y = floor(2.2)

# Pi value (3.14...)
print(pi)

# Get mean from vector
x = mean(numbers)

print(x)

# Get media form array
x = median(numbers)

print(x)

# Standard desviation from array
x = sd(numbers)

print(x)

# Percentil
quantile(numbers, probs = c(.25, .5, .75))

print(x)

# Median
x = median(numbers)

# Mean
x = mean(numbers)

print(x)

# Function to get Mode
mde <- function(c) {
  u <- unique(c)
  u[which.max(tabulate(match(c, u)))]
}

print(mde(numbers))