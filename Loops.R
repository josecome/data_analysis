#While: loop until the condition is false i = 3
i <- 1
while (i < 4) {
  print(i)
  i = i + 1
}

#While: loop but stop if 1 == 2  
i = 1
while (i < 4) {
  print(i)
  if (i == 2){
    break;
  }
  i = i + 1  
}

#Interupt current interation and continue with next
i = 1
while (i < 4) {
  print(i)
  if (i == 2){
    next;
  }
  i = i + 1  
}

#Loop but allow change scope when the condition is not meet any more  
i = 1
while i < 4:
  print(i)
  i += 1
else:
  print("i is no longer less than 6")

#Loop from array
a = ["a", "b", ""]
for (x in a){
  print(x)
}

#Use breack to interrupt loop
a = ["a", "b", "c"]
for (x in a){
    break;
}

#Loop in range	
for (x in 2:8){
  print(x)
}

#Break if x = 4
for (x in 2:8){
  if (x == 4){
      print(x);
      break;      
  } else {
      print("I am still here!");
  }
}

#Vector
ary = c("A", "B", "C")

#Loop in array
for (x in ary){
  print(x)
}

