
###statistics for single vector
library(ISwR)
data(juul)
dim(juul)
head(juul)
tail(juul)

mean(juul$igf1, na.rm = T)
sum(juul$igf1, na.rm = T)
length(juul$igf1, na.rm = T)

is.na(juul$igf1)

sum(is.na(juul$igf1)) # the number of missing values
sum(!is.na(juul$igf1))

summary(juul$igf1)
summary(juul)

juul$sex <- factor(juul$sex, labels = c("M", "F"))

juul<-transform(juul, menarche=factor(menarche,
labels=c("no","yes")),tanner=factor(tanner,
labels=c("one","two","three","four","five")))

summary(juul)

###grphics
###hist
x <- rnorm(50)
hist(x)

x <- c(1.5, 2.5, 3.5, 4.5, 5.5, 6.5, 8.5, 9.5, 12.5)
y <- c(5, 7, 12, 2, 1, 4, 14, 2, 3)
z <- rep(x, y)
hist(z)
brk <- c(0,1,2,3,5,7,9,10,11,13)
hist(z, breaks = brk)

###empirical distribution
x <- rnorm(100)
n <- length(x)
p <- (1:n)/n
plot(sort(x), p, type = "s") # empirical
plot(x, pnorm(x)) # normal

par(mfrow = c(1,2))

x <- rcauchy(100)
par(mfrow = c(1,2))
plot(sort(x), p, type = "s")
plot(x, pnorm(x))

###qq-plot
x <- rnorm(100, mean= 2, sd= 0.5)
p <- (1:100)/100
plot(sort(x), qnorm(p))

qqnorm(x)

x <- rcauchy(100)

###boxplot
data(IgM)
boxplot(IgM)

par(mfrow = c(1,2))
boxplot(IgM)
boxplot(log(IgM))

par(mfrow = c(2,2))
boxplot(sin(IgM))
boxplot(cos(IgM))

par(mfcol = c(2,2))

###statistics by group
data(red.cell.folate)
attach(red.cell.folate)
xbar <- tapply(folate, ventilation, mean)
s <- tapply(folate, ventilation, sd)
n <- tapply(folate, ventilation, length)

cbind(mean = xbar, std.dev = s, size = n)

tapply(juul$igf1, juul$tanner, mean, na.rm =T)

###graphics for group
###hist
data(energy)
par(mfrow = c(2,1))
exp.lean = energy$expend[energy$stature == "lean"]
exp.obese = energy$expend[energy$stature == "obese"]

hist(exp.lean)
hist(exp.obese)

par(mfrow = c(2,1))
hist(exp.lean, breaks = 10, xlim = c(5, 13), ylim= c(0,6), col ="white")
hist(exp.obese, breaks = 10, xlim = c(5, 13), ylim= c(0,6), col ="grey")

###boxplot
par(mfrow = c(1,2))
boxplot(exp.lean)
boxplot(exp.obese)

boxplot(energy$expend ~ energy$stature)

boxplot(exp.lean, exp.obese)

###stripchart
par(mfrow = c(2,2), mex = 0.3, mar = c(3,3,2,1)+0.1)
stripchart(energy$expend ~ energy$stature)
stripchart(energy$expend ~ energy$stature, method = "stack")
stripchart(energy$expend ~ energy$stature, method = "jitter")
stripchart(energy$expend ~ energy$stature, method = "jitter", jitter = 0.03)

###tables