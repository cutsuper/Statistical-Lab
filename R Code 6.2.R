####assumption : 1. both sample are normal

###example 2
###var equal
drug <- c(18, 43, 28, 50, 16, 32, 13)
untr <- c(40, 54, 26, 63, 21, 37, 39)
xbar <- mean(drug)
ybar <- mean(untr)
n1 <- length(drug)
n2 <- length(untr)
s12 <- sum((drug-xbar)^2)/(n1-1)
s22 <- sum((untr-ybar)^2)/(n2-1)
var(drug)
var(untr)

F0 <- s12/s22
###statistic is 0.9223, df1 is 6, df2 is 6
###Fupper is 5.8198 and Flower is 0.1718, we cannot rej H0, we think they are equal var.
qf(0.975, df1 = 6, df2 = 6)
qf(0.025, df1 = 6, df2 = 6)

###pooled var t-test
Spool = sqrt(((n1-1)*s12 + (n2-1)*s22)/(n1+n2-2))
T0 <- (xbar - ybar -0 )/ (Spool*sqrt(1/n1+1/n2))
qt(0.05, df= n1+n2-2)

###conduct tests with R
###1. check the normality
shapiro.test(drug)
shapiro.test(untr)
###the p value is 0.51 and 0.75 far greater than 0.05, we think both of them follow normal distribution
###we use t-test
###2. check var equal
var.test(drug, untr)
###the p value is 0.9244 far greater than 0.05, we cannot reject H0, means we think the variances are equal
###pooled var t-test
###3. test
t.test(drug, untr, alternative = 'less', var.equal = T)
###the p value is 0.081 which is greater than 0.05, we cannot reject H0 at significance level is 0.05, means the treatment is not so effective.
t.test(drug, untr)
wilcox.test(drug, untr, alternative = 'less')
###the p value is 0.1043 which is also greater than 0.05, we cannot reject H0

###Review example
nonsmokers = c(18, 22, 21, 17, 20,17, 23, 20 ,20, 22, 21)
smokers = c(16, 20, 14, 21, 20, 18, 13, 15, 17 ,21)

###1. check normality
shapiro.test(nonsmokers)
shapiro.test(smokers)
###both are normal samples
###t-test
var.test(nonsmokers, smokers)
###variances are equal
###pooled var t test
t.test(nonsmokers, smokers, alternative = 'greater', var.equal = T)
###reject the null hypothesis

### example 3
Nd <- c(0, 10, -3, 15, 2, 27, 19, 21, 18, 10 )
Od <- c(8, -4, 7, 5, 10, 11, 9, 12, 7, 8)

###1. check normality
shapiro.test(Nd)
shapiro.test(Od)
###Old drug are not normal
wilcox.test(Nd, Od, alternative = 'greater')
###p value is larger than 0.05, we cannot rej H0

### grouped data
library(ISwR)
data(energy)
exlean = energy$expend[energy$stature == 'lean']
exobese = energy$expend[energy$stature == 'obese']

t.test(exlean, exobese)
t.test(energy$expend ~ energy$stature)

t.test(exlean, exobese, var.equal = T)
t.test(energy$expend ~ energy$stature, var.equal =T )

var.test(energy$expend ~ energy$stature)
var.test(exlean, exobese)

wilcox.test(energy$expend ~ energy$stature)

### change significance level
fit <- t.test(exlean, exobese)
fit <- t.test(exlean, exobese, conf.level = 0.9)
fit$conf.int