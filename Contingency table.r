# Table of Contigency
# Contingency table also known as cross tabulation or crosstab is a tabular mechanism 
# in matrix format that display multivariate frequency distribution of the variables. 
# This table is understood as the relationship between categorical variables.

fruit <- c("Orange", "Banana")
like <- c("yes","no")
ocurrancy <- c(22,16,406,841)

table <- expand.grid(fruit=fruit,
                     like=like
                     )
# table
# fruit like
# 1 Orange  yes
# 2 Banana  yes
# 3 Orange   no
# 4 Banana   no

table <- cbind(table, count=ocurrancy)
table2 <- xtabs(ocurrancy ~ fruit+like,
      data=table
      )
# like
# fruit    yes  no
# Orange  22 406
# Banana  16 841

n1 <- sum(table2[1,])
n2 <- sum(table2[2,])
p1 <- table2[1,1]/n1
p2 <- table2[2,1]/n2

alpha <- 0.05
zalfa_dif <-qnorm(1-alpha/2)

# Differences
dif <- p1-p2
sum1 <- (p1*(1-p1))/n1  
sum2 <- (p2*(1-p2))/n2
dev_dif <- sqrt(sum1+sum2)

int_dif <- c(dif-zalfa_dif*dev_dif, 
             dif+zalfa_dif*dev_dif)

#Odds Ratio
risk <- p1/p2
sum1r <- (1-p1)/(n1*p1)
sum2r <- (1-p2)/(n2*p2)
dev_lr <- sqrt(sum1r+sum2r)
int_lr <- log(risk) + c(-1,1)*zalfa_dif*dev_lr
int_r <- exp(int_lr)

or <- (p1/(1-p1))/(p2/(1-p2))
dev_lor <- sqrt(sum(1/table2))
int_lor <- log(or) + c(-1,1)*zalfa_dif*dev_lor
int_or <- exp(int_lor)

