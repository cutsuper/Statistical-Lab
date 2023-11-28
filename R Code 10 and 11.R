#2 way anova
Drug = c(rep("Placebo",6), rep("5mg",6),rep("10mg",6)) Age = c(rep(c(rep("young",3), rep("old",3)),3)) Value = c(4, 3, -1, 2, 1, -2, 4, 5, 7, 3, 3, 4, 9, 12, 10, 7, 8, 7) 
data<-data.frame(Drug,Age,Value) 

result <- lm(Value ~ Drug + Age + Drug * Age, data =data)
anova(result)
result1<- lm(Value ~ Drug + Age + Drug:Age, data = data) 
anova(result1)
result2 <- lm(Value ~ Drug * Age, data = data)
anova(result2)
result3 <- aov(Value ~ Drug + Age + Drug*Age, data= data)
summary(result3)
result4 <- aov(Value ~ Drug + Age + Drug:Age, data = data)
summary(result4)
result5 <- aov(Value ~ Drug*Age, data = data)
summary(result5)

###residual plot
qqnorm(result$res)
plot(result$fitted,result$res)

###ANOVA for regression
library(ISwR)
data(thuesen)
fit <- lm(short.velocity ~ blood.glucose, data = thuesen)
anova(fit)
logret <- read.table('~/Desktop/d_logret_6stocks.txt', header = T)
fit1 <- lm(Pfizer ~ Intel, data = logret)
anova(fit1)
fit2 <- lm(Pfizer ~ Intel + Exxon, data = logret)
anova(fit2)

### proportion test
prop.test(39, 215, 0.15)
binom.test(39, 215, 0.15)

###rxc table
caff.marital <-matrix(c(652,1537,598,242,36,46,38,21,218,327, 106,67), nrow=3,byrow=T) 
fit3 <- chisq.test(caff.marital)
E <- fit3$expected
O <- fit3$observed

data(juul)
attach(juul)
x <- table(sex, tanner)
chisq.test(x)
chisq.test(sex, tanner)