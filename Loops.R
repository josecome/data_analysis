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

#Loop from Vector
c = c("a", "b", "c", "d")
for (x in a){
  print(x)
}

#Use break to interrupt loop
for (i in c){
    if(i == "c") {
        break
    }
    print(i)
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


