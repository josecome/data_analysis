#=============================By Jose Jaime Come=====================================================================
#=============================06Aug2024==============================================================================
#=========================Machine Learning: Predicting outcomes using Binary Logistic Regression=====================

hours_spent <-c(0.1,0.2,0.3,0.9,1.3,1.4,1.7,1.8,2,2.1,2.3,2.4,2.7,2.8,3.2,3.3,3.5,3.6)
approved <- c(0,0,0,0,1,0,0,0,1,1,0,1,1,0,1,1,1,1)

df <- data.frame(hours_spent, approved)

summary(df)

# save model
m1 <- glm(approved ~ hours_spent,
          data = df,
          family = "binomial"
)

# print results
# In coefficients you find the most important results
# B0 and B1 in Estimate
# p-values in Pr(>|z|)
# H0: Bj=0 vs H1: Bj <> 0 for j = 0,1 using Wald test
# alpha = 0.05, if the p-value displayed is low in means that their are more evidence that the coefficient is different from 0
# when B1=0, X and Y are independent, (probability of approved will not depend on hours_spent)
# When B1>0, the probability that Y=1 increases with X (probability of approved will increases with hours_spent) and
# when B1<0, the probabiity that Y=1 decreases with X (probability of approved will decreases with hours_spent).
summary(m1)

# Multiplicative change in the odds when X increases by 1 unit
exp(coef(m1)["hours_spent"])
# Extra hour increase chance to pass by factor of 6.

# Predict
# predict probability to develop heart disease
pred <- predict(m1, newdata = data.frame(hours_spent = c(4.0)), type = "response"
)

# print prediction
pred

# if student studies 4.0hours has 97.4% chance of approve

# With confidence interval
pred <- predict(m1, newdata = data.frame(hours_spent = c(4.0)), type = "response", se = TRUE)

# print prediction
pred$fit

# 95% confidence interval for the prediction
lower <- pred$fit - (qnorm(0.975) * pred$se.fit)
upper <- pred$fit + (qnorm(0.975) * pred$se.fit)
c(lower, upper)
