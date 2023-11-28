###multi linear regression
data <- read.table('~/Desktop/Galton.txt', header = T)

data <- read.table('http://www.randomservices.org/random/data/Galton.txt', header = T)

y <- data$Height
x1 <- data$Father
x2 <- data$Mother
x3 <- data$Gender
x3 <- as.numeric(data$Gender) - 1

mod <- lm(y ~ x1 + x2 + x3)
summary(mod)

###confidence interval
confint(mod, level = 0.95)
confint(mod, level = 0.9)

###check goodness
par(mfrow = c(2,2))
plot(mod)

###general linear model
x3 <- data$Gender
mod1 <- glm(y ~ x1 + x2 + factor(x3))
summary(mod1)

x3 <- relevel(factor(x3), ref = 'M')
mod1 <- glm(y ~ x1 + x2 + factor(x3))
summary(mod1)

###xlsx file
install.packages('gdata')
library(gdata)
read.xls('~/Desktop/heat.xlsx')