
library(car)
library(lmtest)
library(sandwich)
library(stargazer)
#library(smaa)

model <- lm(mpg~disp+hp+wt+drat, data=mtcars)

?mtcars

coeftest(model,vcov=vcovHC(model))

#4 Zero Conditional Mean/Linear conditional mean
#x11()
plot(model, which =1)

plot(mtcars$disp,model$residuals)

plot(mtcars$hp,model$residuals)

plot(mtcars$wt,model$residuals)

plot(mtcars$drat,model$residuals)

#plot.smooth.line(mtcars$drat,model$residuals, f=0.1)

# Variance Inflation Factor
vif(model)
vif(model) > 4

#5 Homoskedasticity
#x11()
plot(model, which = 3)

#6 Normality of Errors
#x11()
plot(model, which = 2)

# Look at the histogram of residuals
#x11()
hist(model$residuals, breaks = 20, main = "Residuals from Linear Model Predicting MPG")



# Estimating and testing significance of coeficients
# With robust standard errors
coeftest(model, vcov = vcovHC)

# Wt summary
summary(model)

mtcars2<-mtcars[,c("mpg","disp","hp","wt","drat")]

pairs(mtcars2)
cor(mtcars2)


# Leverage (Actual Influence)
# Cooks distance
#x11()
plot(model, which=5)

# Log transform mpg
model2 <- lm(log(mpg)~disp+hp+wt+drat, data=mtcars) 
#x11()
coeftest(model2,vcovHC)

plot(model2, which=1)

# Log transform Q-Q Plot
#x11()
plot(model2, which=2)

# Log transform heteroskedasticity
#x11()
plot(model2, which=3)

# Log transformed Leverage (Actual Influence)
# Cooks distance
#x11()
plot(model2, which=5)


# Comparing two models
paste('Level-level Model Adjusted R Squared: ', summary(model)$adj.r.squared)
paste('Log-level Model Adjusted R Squared: ', summary(model2)$adj.r.squared)

# format regression comparison
(se.model = sqrt(diag(vcovHC(model))))
(se.model2 = sqrt(diag(vcovHC(model2))))

# We pass the standard errors into stargazer through 
# the se argument.
stargazer(model, model2, type = "text", omit.stat = "f",
          se = list(se.model, se.model2),
          star.cutoffs = c(0.05, 0.01, 0.001))

