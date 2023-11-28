###preparation
weight <- c(60, 72, 57, 90, 95, 72)
height <- c(1.75, 1.80, 1.65, 1.90, 1.74, 1.91)
bmi <- weight / height^2
intake.pre <- c(5260,5470,5640,6180,6390,6515,6805,7515,7515,8230,8770) 
intake.post <- c(3910,4220,3885,5160,5645,4680,5265,5975,6790,6900,7335)

###subset and transform
library(ISwR)
data(thuesen)
thuesen[thuesen$blood.glucose<7,]
thue2 <- subset(thuesen, blood.glucose<7)
thue3 <- transform(thuesen, log.gluc = log(blood.glucose))

###grouped data
data(energy)
energy$expend[energy$stature == "lean"]
# dataset$variablename

data <- energy$expend
group <- energy$stature
split(data,group)

###sorting
sort(intake.post)
sort(intake.post, decreasing = T)
order(intake.post)
intake.post[order(intake.post)]
intake.pre[order(intake.post)]

###implicit loops
lapply(thuesen, mean, na.rm =T)
sapply(thuesen, mean, na.rm =T)

m <- matrix(rnorm(12), nrow = 4)
apply(m , 2, min)
apply(m, 1, max)

tapply(data, group, median)

###graphics
x <- runif(50, 0, 2) # create {xi} from uniform(0,2), i = 1,2,...,50
y <- runif(50, 0, 2)
plot(x, y , main = "Main title", sub ="subtitle", xlab ="u1", ylab ="y-label")

text(0.6, 0.6, "text")
abline(h = 0.6)
abline(v = 0.6)
abline(a = 0.5, b = 0.3) # y = a + b*x
paste("side",1:4)
mtext(paste("side",1:4), side=1:4, line=-1,font=2)

plot(x, y , type ="n" , xlab = "", ylab= "")
plot(x, y , type ="n" , xlab = "", ylab= "", axes = F)
points(x, y)
axis(1)
axis(2, at = seq(0.2, 1.8, 0.2))
box()
title(main = "ok", sub= "sub" ,xlab="x", ylab="y")

###R programming
x <- rnorm(100)
hist(x, freq = F)
curve(dnorm(x), add = T)

function_name = function(x,y){
  z = x+y
  return(z)
}
function_name(1,100)

histwithcurve<-function(x) {
  hist(x,freq=F)
  curve(dnorm(x),add=T)
}
histwithcurve(x)

###implicit looping
y <- 12345
x <- y/2
# Newton's method of calculating the square root
while(abs(x^2-y)>10^(-8))  x <- (x + y/x)/2
# update rule x <- (x + y/x)/2

while(condition) run something
while(condition){
  something
}


x <- y/2

repeat{
	x <- (x + y/x) / 2
	if (abs(x^2-y) < 10^(-8)) break
	}

x <- seq(0 ,1 ,0.05)
plot(x, x, type="l")
for(j in c(2:8)) {
	lines(x, x^j)
}


t.test(bmi, mu = 22.5)

t.test(weight, height)

###session management
ls()
remove("weight")
save.image("~/Desktop/a.RData")
load("~/Desktop/a.RData")
remove(list=ls())
detach("package:ISwR")
attach(thuesen)
blood.glucose
detach(thuesen)
logret<- read.table("~/Desktop/d_logret_6stocks.txt",header=T)


