##Stata Training Wheels Walk through the stata2r.pdf cheat sheet

#Dial up wage1 dataset
library(wooldridge)
data(package = "wooldridge")
data("wage1", package = "wooldridge")

#Get to know your data
?wage1          #-->view documentation on data
str(wage1)      #-->describe structure of data (like a proc data)
View(wage1)     #-->broswe the data (NOTE the capital V)
summary(wage1)      #-->summarize analog
head(wage1, 20)     #-->view the first 20 rows of data
tail(wage1, 20)     #-->view the last 20 rows of data
table(wage1$female)     #-->tabulate frequencies
table(wage1$female, wage1$nonwhite)

#Create a new variable, prior experience, that is exper less tenure
wage1$prior_exp <- wage1$exper - wage1$tenure 

#Plotting!
hist(wage1$wage) # histogram of `wage` 
plot(y = wage1$wage, x = wage1$educ) #scatter plot
abline(lm(wage1$wage~wage1$educ), col= "red" ) # add fitted line to scatterplot
boxplot(wage1$wage~wage1$nonwhite) # boxplot of `wage` by `nonwhite

#Regressing - OLS!
lm(wage ~ educ, data = wage1)  #Simple linear regression
lm(wage ~ educ, data = wage1[wage1$nonwhite==1, ])  #Simple linear reg, subset on nonwhite
lm(wage ~ educ + exper, data = wage1)  #multivariate linear regression
estimatr::lm_robust(wage ~ educ + exper, data = wage1, se_type = "stata")
            #--> robust standard errors
estimatr::lm_lin(wage ~ educ + exper, data = wage1, clusters = numdep)
            #--> clustered standard errors

#Regressing - Maximum Likelihood/Binary Response Variables!
data("mroz", package = "wooldridge")
glm(inlf~nwifeinc + educ, family =binomial(link="logit"), data=mroz) 
glm(inlf~nwifeinc + educ + family =binomial(link="probit"), data=mroz)


####Robustness checks!

#Breusch-Pagan test for heteroskedasticity
mod <- lm(wage ~ educ + exper + expersq + tenure + tenursq + female, data = wage1)
lmtest::bptest(mod)

#Ramsey test for omitted variables
lmtest::resettest(mod)

####Postestimation!

#Save as an object
mod_mem <- lm(wage ~ educ + exper + expersq, data = wage1)

#Get predicted values
wage1$yhat <- predict(mod_mem)
wage1$resid <- residuals(mod_mem)

residplot <- plot(y=wage1$resid, x=wage1$educ)
