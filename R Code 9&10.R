###prediction
library(ISwR)
attach(thuesen)
fit <- lm(short.velocity ~ blood.glucose)
### y = 1.09781 + 0.02196 * x
1.09781 + 0.02196 * 10
predict(fit, newdata = data.frame(blood.glucose = c(10,15,20)))

###ANOVA
y1 <- c(18.2, 20.1, 17.6, 16.8, 18.8, 19.3, 19.1) 
y2 <- c(17.4, 18.7, 19.1, 16.4, 15.2, 18.4) y3 <- c(15.2, 18.8, 17.7, 16.5, 15.9, 17.1, 16.3) 
y<-c(y1, y2, y3) 
group <- c(rep(1,7), rep(2,6), rep(3,7))
ydata <- data.frame(y = y, group = factor(group))
###
fit <- lm(y ~ group, data = ydata)
anova(fit)
###
fit1 <- aov(y ~ group, data = ydata)
summary(fit1)
###example 2
data(red.cell.folate)
attach(red.cell.folate)
anova(lm(folate~ventilation))
summary(aov(folate ~ ventilation))
tapply(folate, ventilation, mean)
###example 3
data(juul)
attach(juul)
anova(lm(igf1 ~ tanner))###wrong, because tanner is a numerical vector
tanner <- factor(tanner, labels = c('one','two','three', 'four','five'))
anova(lm(igf1 ~ tanner))
###pairwise comparison
summary(lm(folate ~ ventilation))
pairwise.t.test(folate, ventilation, p.adj ='bonferroni')
###relax the assumption
tapply(folate, ventilation, sd)
oneway.test(folate ~ ventilation)
pairwise.t.test(folate, ventilation, pool.sd = F)
###graphical presentation
xbar <- tapply(folate, ventilation, mean)
s <- tapply(folate, ventilation, sd)
n <- tapply(folate, ventilation, length)
sem <- s/sqrt(n)
stripchart(folate~ventilation,vert=T,pch=16 ,method="jitter") 
arrows(1:3,xbar+sem,1:3,xbar-sem,angle=90,code=3,length=0.1) 
lines(1:3,xbar,pch=4,type="b",cex=2) 
###bartlett's test
bartlett.test(folate ~ ventilation)
###two-way anova
data(heart.rate)
heart.rate <- data.frame(hr = c(96,110,89,95,128,100,72,79,100, 92,106,86,78,124,98,68,75,106,86,108,85,78,118,100,67,74, 104, 92,114,83,83,118,94,71,74,102), subj=gl(9,1,36), time=gl(4,9,36,labels=c(0,30,60,120))) 
gl(9,1,36)
attach(heart.rate)
anova(lm(hr~subj + time))
###grapics of two factors
interaction.plot(time, subj, hr)
interaction.plot(subj, time, hr)
###interaction term in two way ANOVA
Drug = c(rep("Placebo",6), rep("5mg",6),rep("10mg",6)) Age = c(rep(c(rep("young",3), rep("old",3)),3)) Value = c(4, 3, -1, 2, 1, -2, 4, 5, 7, 3, 3, 4, 9, 12, 10, 7, 8, 7) 
data<-data.frame(Drug,Age,Value) 
par(mfrow = c(1,2))
plot(Value ~ Drug + Age,data = data)
interaction.plot(data$Age, data$Drug, data$Value)
interaction.plot(data$Drug,data$Age,  data$Value)
result <- anova(lm(Value ~ Drug + Age + Drug*Age))
result1 <- anova(lm(Value ~ Drug + Age + Drug:Age))
result2 <- anova(lm(Value ~ Drug*Age))