###table

caff.marital <- matrix(c(652,1537,598, 242, 36,46,38 , 21, 218,327,106,67),  nrow = 3, byrow = T)
colnames(caff.marital) <- c("0", "1-150", "151-300", ">300")
rownames(caff.marital) <-  c("Married" , "Prev.married", "Single")
names(dimnames(caff.marital)) <- c("marrital", "consumption")

t(caff.marital)

library(ISwR)
data(juul)
juul<-transform(juul,sex=factor(sex,
labels=c("M","F")),menarche=factor(menarche,
labels=c("no","yes")),tanner=factor(tanner,
labels=c("one","two","three","four","five")))

table(juul$sex)
table(juul$sex, juul$menarche)
table(juul$sex, juul$tanner)
table(juul$sex, juul$menarche, juul$tanner)

a <- table(juul$tanner, juul$sex)
margin.table(a, margin = 1)
margin.table(a, margin = 2)

prop.table(a, margin = 1)
prop.table(a, margin = 2)

###barplot
barplot(prop.table(t(caff.marital)), legend.text = colnames(caff.marital), col= c("white", "blue", "grenn", "black"))

###dotcharts
dotchart(t(caff.marital))

###pie charts
par(mfrow = c(2,2))
pie(caff.marital["Married",], main = "Married")
pie(caff.marital["Prev.married",], main = "Prev.married")
pie(caff.marital["Single",], main = "Single")

###one sample t-test 2 side
daily.intake <- c(5260,5470,5640,6180,6390,6515,6805,7515,7515, 8230,8770) xbar <- mean(daily.intake)
std.dev <- sd(daily.intake)
n <- length(daily.intake)
stat <- (xbar - 7725) / (std.dev/sqrt(n))
p <- 2 * min(pt(stat, df = n-1), (1- pt(stat, df = n-1)))
lowerCI <- xbar - qt(0.975, df = n-1) * std.dev/sqrt(n)
upperCI <- xbar + qt(0.975, df = n-1) * std.dev/sqrt(n)

fit <- t.test(daily.intake, mu = 7725)
names(fit)

###one sample t test 1 side
cans <- c(270, 273, 258, 204, 254, 228, 282 
)
xbar <- mean(cans)
std.dev <- sd(cans)
n <- length(cans)
stat <- (xbar - 165) / (std.dev/sqrt(n))
p <- 1 - pt(stat, df = 6)
lowerCI <- xbar - qt(0.95, df =6) * std.dev/sqrt(n)

fit1 <- t.test(cans, mu = 165, alternative = "greater")

###normality check
shapiro.test(cans)

###wilcoxon test (if sample not normal)
fit2 <- wilcox.test(daily.intake, mu =7725)
names(fit2)