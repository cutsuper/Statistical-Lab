
###packages
install.packages("ISwR")

library(ISwR)

###arthimetic expression
4 - 2

3*4

8 / 2

exp(-2)

###assignments
x <- 2

x = 3

2 -> x

###vector
weight <- c(60, 72, 57, 90, 95, 72)
weight = c(60, 72, 57, 90, 95, 72)

height <- c(1.75, 1.80, 1.65, 1.90, 1.74, 1.91)

bmi <- weight / height^2

length(bmi)

xbar <- sum(bmi)/length(bmi)
sum((bmi - xbar)^2)/(length(bmi)-1)

var(bmi) #variance
sd(bmi)

median(weight)
mean(bmi)

cov(weight, height)
cor(weight, height) #

###stamard statistic test

t.test(bmi, mu = 22.5)

###graphics
plot(x=height, y=weight)
plot(height, weight, pch=2)

###vectors
c("Huey","Dewey","Louie")
c('Huey','Dewey','Louie')

log = c(T , T, F, T)

bmi > 22

###quoting
cat("Huey","Dewey","Louie")

c(1, 2, NA, 3)

###vector creating
x <- c(red = "Huey", blue = "Dewey", green = "Louie")
names(x)
names(x) <- c("a", "b", "c")

c(F, 1)
c(2 , "a")
c(T , "b")

seq(4 , 9)
seq(4, 10 ,2)
seq(4, 8 , 0.5)
4 : 9

rep(1 , 5)
oops <- c(7, 9, 13)
rep(oops , 3)
rep(oops, c(1, 2, 3))

###matrices
x <- 1:12
dim(x) <- c(3, 4)

matrix(1:12 , ncol = 4)

matrix(1:12, nrow =3 , byrow = T)

colnames(x) <- letters[1:4]
rownames(x) <- LETTERS[1:3]  ### 8/24
t(x)

cbind(a = c(1,2,3), b = c(4,5,6))
rbind(A = c(1,2,3,4), B= c(5,6,7,8))

###lists
intake.pre <- c(5260,5470,5640,6180,6390,6515,6805,7515,7515,8230,8770) 
intake.post <- c(3910,4220,3885,5160,5645,4680,5265,5975,6790,6900,7335) 
my.list <- list(before = intake.pre, after = intake.post)
l <- list(a = c(1, 2, 3), b = c(T, F), c= matrix(1:4, ncol =2))
###dataframe
k <- data.frame(A = c(1:3), B = c(T,F,T))

###indexing
intake.pre[5]
intake.pre[c(3,5,7)]
intake.pre[3,5,7]
intake.pre[-c(3,5,7)]

###conditional selection
intake.pre[intake.pre>7000]
& | !
intake.pre[intake.pre>7000 & intake.pre <8000]
intake.pre[intake.pre<7000 | intake.pre >8000]
intake.pre[!intake.pre > 7000]
intake.pre > 7000