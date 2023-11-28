###paired sample
library(ISwR)
data(intake)

###paired t test
t.test(intake$pre, intake$post, paired = T)
t.test(intake$pre, intake$post)

wilcox.test(intake$pre, intake$post, paired = T)

before <- c(12.1, 10.6, 13.4, 13.8, 15.5)
after <- c(12.0, 11.0, 14.1, 11.2, 15.3)
diff <- before - after
xbar <- mean(diff)
std.dev <- sd(diff)
n <- length(diff)
stat <- (xbar - 0) / (std.dev/sqrt(n))
lowerCI <- xbar - qt(0.975, df = n-1) * std.dev/(sqrt(n))
upperCI <- xbar + qt(0.975, df = n-1) * std.dev/(sqrt(n))
p <- 2 * min(pt(stat, df = n-1), (1- pt(stat, df =n-1)))

###test normality for difference
shapiro.test(diff)

###significance level for shapiro is 0.05, diff is normal
t.test(before, after, paired = T)
t.test(diff, mu = 0)

###significance level for shapiro is 0.1, diff is not normal
wilcox.test(before, after, paired = T)
wilcox.test(diff, mu = 0)