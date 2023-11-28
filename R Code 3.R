###reading data

logret <- read.table("~/Desktop/d_logret_6stocks.txt", header = T)

logret <- read.table("~/Desktop/d_logret_6stocks.txt")

dim(logret)
names(logret)
logret[1:10,-c(2,4)]
str(logret)
logret$Date = as.factor(logret$Date)
levels(logret$Date)

library(ISwR)
thuesen
thue2 <- transform(thuesen, log.gluc = log(blood.glucose))
write.table(thue2, "~/Desktop/thue2.txt")
write.table(thue2, "~/Desktop/thue2.txt", sep ="\t")
write.table(thue2, "~/Desktop/thue2.txt", sep =",")

write.csv(thue2, "~/Desktop/thue2.csv")

read.csv("~/Desktop/thue2.csv")

write.csv(thue2, "~/Desktop/thue2.csv", row.names = F)

read.table("http://www.sthda.com/upload/boxplot_format.txt", header = T)

###random sampling
sample(1:40, 5)
sample(40, 5)
sample(c("H","T"), 10 , replace = T)
sample(c("succ", "fail"), 10, replace =T, prob=c(0.9, 0.1))

1 / (40 * 39 * 38 * 37 * 36)
1 / prod(40:36)
prod(1:40)/(prod(1:35)*prod(1:5))
factorial(40)/(factorial(35)*factorial(5))
choose(40, 5)

###Densities
x <- seq(-4, 4, 0.1)
dnorm(x)
plot(x, dnorm(x), type="l")
plot(x, dnorm(x, mean = -1, sd = 0.5), type = "l")
plot(x, dnorm(x))
curve(dnorm(x), from = -4, to =4)

x <- seq(0,1, 0.01)
plot(x, dbeta(x, 4, 5), type = "l")
curve(dbeta(x,4,5), from =0, to =1)

x <- seq(0, 50)
plot(x, dbinom(x, size = 50, prob =0.33),type = "h")

x <- 0:50
plot(x, dpois(x, 10), type = "h")

###cdf
pnorm(160, mean = 132, sd = 13)

pbinom(16, size = 20 , prob = 0.5)

x <- seq(-4, 4, 0.1)
plot(x , pnorm(x), type = "l")
plot(x , pnorm(x, mean = -1 , sd = 0.8), type = "l")

x <- 0 : 50
plot(x , pbinom(x, size = 50, prob = 0.33), type = "h")

###quantiles

x <- rnorm(100, mean = 5, sd = 2)

xbar <- mean(x)
sdm <- sd(x)/ sqrt(100)
xbar + qnorm(0.975) * sdm

qbinom(0.5, size = 20, prob = 0.5)

###random sample

rnorm(10 , mean =1 ,sd =2)

rbinom(10, size = 20 , prob =0.33)

###quantiles
x <- rnorm(50)
quantile(x)
p <- seq(0, 1, 0.1)
quantile(x, p)
quantile(x, 0.4)

