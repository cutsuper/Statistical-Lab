### read excel file
library(gdata)
data <- read.xls('~/Desktop/heat.xlsx')
attach(data)
fit <- lm(Y ~ X1 + X2 + X3 + X4)
fit <- lm(data$Y ~ data$X1 + data$X2 + data$X3 + data$X4)
fit <- lm(Y ~ X1 + X2 + X3 + X4, data = data)

###best subsets
install.packages('leaps')
library(leaps)
leaps1 <- regsubsets(Y ~ X1 + X2 + X3 + X4, data = data, nbest = 10)
summary(leaps1)
leaps1 <- regsubsets(Y ~ X1 + X2 + X3 + X4, data = data, nbest = 3)
plot(leaps1, scale = 'r2')
plot(leaps1, scale = 'adjr2')
plot(leaps1, scale = 'bic')
plot(leaps1, scale = 'Cp')

###stepwise
step(lm(Y~X1 + X2 + X3 + X4, data = data))

###linear relationship
attach(data)
cor.test(X1, X2)
summary(lm(X1 ~ X2))