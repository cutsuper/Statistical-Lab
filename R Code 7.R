###simple linear regression
library(ISwR)
attach(thuesen)
lm( short.velocity ~ blood.glucose)
summary(lm( short.velocity ~ blood.glucose))
#formula, information about residual, information about coefficients, information about coefficient of determination, information about anova

###plot regression
plot(blood.glucose, short.velocity)
abline(lm( short.velocity ~ blood.glucose))

###residuals and fitted values
lm.velo <- lm(short.velocity ~ blood.glucose)
#fitted values
fitted(lm.velo)
#residuals
resid(lm.velo)

fitted(lm.velo) + resid(lm.velo)
###plot
plot(blood.glucose, short.velocity)
abline(lm.velo)

lines(blood.glucose, fitted(lm.velo))
###deal with missing values (NA)
lines(blood.glucose[-16], fitted(lm.velo))

lines(blood.glucose[!is.na(short.velocity)], fitted(lm.velo))

lines(blood.glucose[!is.na(short.velocity) & !is.na(blood.glucose)], fitted(lm.velo))

options(na.action = na.exclude)
lm.velo <- lm(short.velocity ~ blood.glucose)
fitted(lm.velo)
resid(lm.velo)

plot(blood.glucose, short.velocity)
lines(blood.glucose, fitted(lm.velo))
segments(blood.glucose, short.velocity, blood.glucose, fitted(lm.velo))
### plot residuals
plot(fitted(lm.velo), resid(lm.velo))
qqnorm(resid(lm.velo))
shapiro.test(resid(lm.velo))

###another example
logret <- read.table("~/Desktop/d_logret_6stocks.txt", header = T)
fit1 <- lm(logret$Pfizer ~ logret$Intel)
summary(fit1)
names(fit1)
fit1$coefficients
fit1$resuduals
fit1$fitted.value

###yi = beta1 xi + epsiloni
fit2 <- lm(logret$Pfizer ~ logret$Intel - 1)
fit2 <- lm(logret$Pfizer ~ logret$Intel + 0)

###correlation
cor(blood.glucose, short.velocity)
sum(short.velocity, na.rm = T)
cor(blood.glucose, short.velocity, na.rm = T)
cor(blood.glucose, short.velocity, use = 'complete.obs')
cor(blood.glucose, short.velocity, use = 'all.obs')
cor.test(blood.glucose, short.velocity)