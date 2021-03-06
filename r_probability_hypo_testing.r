
#--------------#	Probability models

###------### Binomial model

#	dbinom(x = , size = , prob = ) gives the density
#	pbinom(q = , size = , prob = ) gives the distribution
#	qbinom() gives the quantilte function
#	rbinom() do random draw from the distribution



#-------- dbinom(x = , size = , prob = )
# the probablity of get 4 of rolling a dice = 1/6
# Then, the prob. of rolling 8 times and get 5 4s is 0.0041...

result = dbinom(x = 5, size = 8, prob = 1/6)
print(result)
# [1] 0.004167619





# We can also compute the prob. for each case, 
# i.e., get one 4, two 4s, ...
results = dbinom(x = 0:8, size = 8, prob = 1/6)
print(results)
# [1] 2.325680e-01 3.721089e-01 2.604762e-01 1.041905e-01 2.604762e-02
# [6] 4.167619e-03 4.167619e-04 2.381497e-05 5.953742e-07

# sum of the prob. = 1
sum(results)
# [1] 1




# plot probablities
png('figures/prob_of_8.png')
barplot(results,
				names.arg = 0:8,
				space = 0,
				ylab = 'Prob(X = x)',
				xlab = 'x'
)
dev.off()



#--------------- pbinom(q = , size = , prob = )
# pbinom returns cumulative probability, given a quantile value q
# Compute the prob. of at least three 4s, i.e., Pr(X >= 3) = 1-Pr(X<=2)
# Here we use pbinom(q = obj, size = , prob = )

1 - pbinom(q = 2, size = 8, prob = 1/6)



# pbinom() vs qbinom()

# pbinom(): given q, return p. 
# qbinom(): given p, reutrn q
# where q(quantile), p(cumulative probability)


#--------------- qbinom(p = , size = , prob = )
# qbinom() is the inverse of pbinom.
# It return the "quantile value" q, given a cumulative probability p.

pbinom(q = 2, size = 8, prob = 1/6)
# [1] 0.8651531		this is p. Now we put p in qbinom
qbinom(p = 0.86, size = 8, prob = 1/6)
# [1] 2						this is q.










###------### Poisson model

# dpois(x = , lambda = ), lambda: mean and variance
# dpois() return Pr(X = x), it is the value of density.
# ppois() return Pr(X <= x), left cumulative probability in CDF.


# this return the value of density function, when x = 5 on the horizontal
# axis. We can check this by plotting the DF of the Poisson distribution.
dpois(x = 5, lambda = 3)
# [1] 0.1008188


# Let's plot the density when x from 5 to 20
png('figures/Poisson_test_x=5.png')
plot(dpois(x = 5:20, lambda = 3),
		 main = 'Poisson (lambda = 3)',
		 ylab = 'density',
		 xlab = 'X',
		 type = 'l'
)
dev.off()

# Clearly, Pr(X = 5) is about 0.1, same as what we got from dpois()



color_theme = c('red', 'blue', 'orange', 'yellow', 'green', 'pink')
png('figures/Poisson_0-20_diff_lambda.png')
plot(x = seq(0,20),
		 y = dpois(0:20, 0.1),
		 type = 'l'
)
for (i in c(0.5, 0.8, 1, 3, 5, 10)){
		lines(x = seq(0,20),
					y = dpois(0:20, i),
					col = color_theme[which(i == c(0.5, 0.8, 1, 3, 5, 10))]
		)
}
dev.off()







## ppois(q = , lambda = )

png('figures/Poisson_cdf.png')
plot(ppois(q = 0:20, lambda = 3),
		 type = 'l'
)
dev.off()





## qpois(p = , lambda) provides the quantile value. Reverse of ppois()
# In ppois, lets use q = 3, lambda = 5
ppois(q = 3, lambda = 5)
# [1] 0.2650259

# Let's check, if q = 3 when we use the output (cumulative probability).
qpois(p = 0.26, lambda = 5)
# [1] 3

# Checked














###------### Uniform distribution
# X ~ UNIF(a,b)

## dunif(X, min = , max = ),
# min:	a,
# max:	b


# Plot X ~ uniform(2,10)

png('figures/Uniform_2_10.png')
plot(
		 # You must specify x, otherwise, you are going to mess up the pic.
		 x = -2:20,
		 y = dunif(x = -2:20, min = 2, max = 10),
		 ylim = c(0,0.5),
		 xlim = c(-5, 25)
)
dev.off()




## punif(q = , min, max)

# this would be zero, because the support of the cdf is 4~10
punif(q = 3, min = 4, max = 10)
# [1] 0


# Here the prob of x <= 7. Clearly, 7 is the median/mean in 4~10 interval.
punif(q = 7, min = 4, max = 10)
# [1] 0.5




## qunif(p = , min, max)

qunif(p = 0.5, 4, 10)
# [1] 7






## runif(n = , min = , max = )

# Let's randomly draw 6 obs from uniform(4,10)
runif(n = 6, 4, 10)
# [1] 6.355950 7.783763 5.747722 8.269437 8.343312 7.163721








###------### Normal distribution



## dnorm(x = , mean, sd = )

# plot standard normal:

# the curve would be smoother, if you generate more data.
x = seq(-5,5, length.out = 100)
png('figures/SD_Normal.png')
plot(
		 x,
		 dnorm(x, mean = 0, sd = 1),
		 type = 'l'
)
dev.off()



# more df with different mean
a = list(c(1,0.5), c(1,2), c(1,5), c(4,2), c(-2, 2))
x = seq(-5,5, length = 100)
png('figures/Normal_multiple.png')
plot(
		 x,
		 y = dnorm(x, mean = 0, sd =1),
		 type = 'l',
		 xlim = c(-5,6),
		 ylim = c(0,1)
)
for (item in a){
 	 lines(x,
					dnorm(x,mean = item[1], sd = item[2])
	 )
}
dev.off()









## pnorm(q = , mean = , sd = )
x = seq(-5,5, length = 100)
png('figures/SD_Normal_CDF.png')
plot(
		 x,
		 pnorm(x, 0,1),
		 type = 'l'
)
dev.off()




## qnorm(p = , mean = , sd = )
pnorm(1, 0, 1)
# [1] 0.8413447

qnorm(0.84, 0, 1)
# [1] 0.9944579 pretty close to 1








## rnorm(n = , mean = , sd = )
# Generate "n" obervations from normal distribution with 'mean', 'sd'.

# generate from sd norm
rnorm(n = 5, mean = 0, sd = 1)
# [1] 1.2685725 0.3540938 1.0729062 1.0447290 1.2036311








## Quantile-Quantile function
# qqnorm(data,...)

# qqnrom() can be used to check if your data are normal distributed.
# If yes, scatters should be approximately in a line.

# We can do this by:
# manually generate a sample from std normal.
sample1 = rnorm(n = 700,0,1)
png('figures/QQFunction_norm_data.png')
qqnorm(sample1)
qqline(sample1, col = 'gray')
dev.off()
# Clearly, it is normal.



# Now let's check if the price of BTC or log(price) of BTC is normal
# distributed.
df = read.csv('data/NewCleanData.csv')
price = df$Open_price
log_price = log(price)

png('figures/QQFunction_price.png')
qqnorm(price)
qqline(price)
dev.off()
# Clearly, price level is not normal distributed.


# What about log(price)?

png('figures/QQFunction_log_price.png')
qqnorm(log_price)
qqline(log_price)
dev.off()
# It is not.




# How about the supply?
png('figures/QQFunction_cir_supply.png')
qqnorm(df$cir_supply)
qqline(df$cir_supply)
dev.off()
# Not close.











###------### student's t-distribution
# Four common functions to use.
#	dt(x,v)
#	pt(q,v)
#	qt(p,v)
#	rt(n,v)
# v: degree of freedom




# Plot student's t with different df.
x = seq(-5,5, length = 300)

par_list = list(c(1,'red'),c(20,'blue'),c(100, 'green'))

png('figures/student_t.png')
plot(
		 x,
		 dt(x,2),
		 type = 'l'
)
for(item in par_list){
		lines(x, 
					# don't forget to transform "1" into an numeric value.
				 dt(x, sapply(item[1], as.numeric)),
				 col = item[2]
		)
}
dev.off()








###------### Exponential distribution

# X ~ EXP(lambda)
# X is a non-negative number.
# mean = 1/lambda
# var = 1/lambda^2


# dexp(x, rate)
# rate: lambda
# x:		data

x = seq(0.1,8, length = 100)
png('figures/Exponential_distribution.png')
plot(x,
		 dexp(x, rate = 1.5),
		 type = 'l'
)
dev.off()


# c(lambda, line_type)
par_list = list(c(0.5, 2), c(1.5, 3), c(4, 6))
png('figures/Exponential_diff_lambda.png')
plot(x,
		 dexp(x, rate = 1),
		 type = 'l',
		 main = 'Exponential with different lambda',
		 ylab = 'density',
		 xlab = 'X'
)
for (item in par_list){
		lines(x,
					dexp(x, rate = item[1]),
					lty = item[2]
		)
}
legend('topright', 
			 legend = c(
									"exp(1)",
									"exp(0.5)",
									"exp(1.5)",
									'exp(4)'
			 ),
		   lty = c(1,2,3,6)
)
dev.off()





## pexp(q = , rate = )
## qexp(p = , rate = )

pexp(q = 3, rate = 0.2)
# [1] 0.4511884 = cumulative probability (from cdf)
# It says Pr(X <= 3) = 0.4511884

qexp(p = 0.451, rate = 0.2)
# [1] 2.998284 Checked.


















###------### chi-square distribution
# Chi-square sums of squared normal variates and is often related
# to operations concerning sample variances of normally distributed data.


# dchisq(x, df)
# pchisq(q, df, lower.tail),			lower.tail = F, get prob(area) at right tail
# qchisq(p, df)
# rchisq(n, df)



# Since chi square is squared norm, clealy, its support is non negative.
x = seq(0,5,length = 300)
png('figures/Chi_square_Std_Normal.png')
plot(x,
		 dchisq(x, df = 1),
		 type = 'l',
		 main = 'Chi-square vs Std Normal',
		 ylab = 'density',
		 xlab = 'X'

)
lines(x,
			dnorm(x),
			lty = 2
)
dev.off()



par_list = list(c(0.1, 2), c(3, 4), c(5, 5))
png('figures/Chi_square.png')
plot(x,
		 dchisq(x, df = 1),
		 type = 'l',
		 main = 'Chi-square with diff df',
		 ylab = 'density',
		 xlab = 'X'
)
for (item in par_list){
		lines(x,
					dchisq(x, df = item[1]),
					lty = item[2]
		)
}
legend('topright',
			 legend = c(
									'df = 0.1',
									'df = 1',
									'df = 3', 
									'df = 5'
									),
			 lty = c(2,1,4,5)
)

dev.off()










#--------------#	Sampling Distribution
# Details see sampling distribution part in 
# "Common Knowledge for econometrics".


x = seq(16, 28, length = 100)
fx.sample = dnorm(x, mean = 22, 1.5/sqrt(5))
fx.true = dnorm(x, mean = 22, 1.5)
png('figures/sampling_vs_true_distribution.png')
plot(x, 
		 fx.true,
		 main = 'sampling and true distribution',
		 ylab = 'density',
		 type = 'l',
		 ylim = c(0,0.8)

)
lines(x,
			fx.sample,
			lwd = 2,
			lty = 2
)
legend('topright', 
			 legend = c('true distro', 'sampling distro'),
			 lty = c(1,2)
)
dev.off()










#--------------#	Confidence Intervals


# compute critical values for 0.95 CI
se = 1.5
right_bound = qt(0.975, 4)
# [1] 2.776445 right tail
left_bound = qt(0.025, 4)
# [1] -2.776445 left tail

fx.bound = dt(right_bound, 4)



x = seq(-4, 4, length = 100)
png('figures/confidence_interval.png')
plot(
		 x,
		 dt(x, 4),
		 type = 'l'
)
abline(h = c(0),
			 col = 'gray'

)
segments(
				 x0 = c(left_bound, right_bound),
				 y0 = c(0,0),
				 x1 = c(left_bound, right_bound),
				 y1 = rep(fx.bound, 2)
)
dev.off()













#--------------#	Testing Means


#-------------------
### t-test:(Single Mean)

# Method 1
# Let's test if the population mean is 80 by using a sample.

# generate a sample
n = 40
# make sure we have the same generated numbers, set the seed
set.seed(5)
sample = rnorm(n, 80, 1.5)
# compute the sample mean and SD
sample_mean = mean(sample) 		# X = [1] 80.10174
# sample SD: s
sample_sd = sd(sample)				# s = [1] 1.651756
sample_se = sample_sd/sqrt(n)	# [1] 0.2611655

# T statistics:
sample_T = (sample_mean - 80)/sample_se		# [1] 0.3895706

# compute the p-value, i.e., the cumulative prob. using pt()
# remember, sample_T is t value on the horizontal axis of the density.
sample_p_value = pt(sample_T, n-1)		#	[1] 0.6505133

# Clearly, p-value is much greater than 0.05. We fail to reject 
# the null.



png('figures/t-test.png')
x = seq(-4,4,length = 100)
plot(x,
		 dt(x,n-1),
		 type = 'l',
		 main = 'Test the mean of 80',
		 xlab = 't',
		 ylab = 'density (DOF = 39)'

)
abline(h = c(0), col = 'gray')
segments(
				 x0 = sample_T,
				 y0 = 0,
				 x1 = sample_T,
				 y1 = 0.4,
				 lty = 3
)

dev.off()








# Method 2
# R has a built in function for t-test:
# t.test(x = sample, mu = mean, alternative = '')
# "alternative" can be ???two.sided???, ???less???, ???greater???


t.test(x = sample, mu = 80, alternative = 'less')

#	        One Sample t-test
#	
#	data:  sample
#	t = 0.38957, df = 39, p-value = 0.6505
#	alternative hypothesis: true mean is less than 80
#	95 percent confidence interval:
#	     -Inf 80.54177
#	sample estimates:
#	mean of x
#	 80.10174










#-------------------
### t-test:(Two Mean) 


## unpooled variances
# obs are unpaired, independent, and with unpooled var. 
# Method 1


# Generate data from N(76,2), N(80,2)
set.seed(5)
n1 = 44
n2 = 31
sample1 = rnorm(n1, 76, 2)
sample2 = rnorm(n2, 80, 2)



# Compute sample mean and se, i.e., s
sample1.mean = mean(sample1)		# [1] 76.24008
sample2.mean = mean(sample2)		# [1] 79.66198


sample1.s = sd(sample1)/n1			# [1] 0.05069484
sample2.s = sd(sample2)/n2			# [1] 0.04731536


# Compute df:

df.upper = ((sample1.s**2/n1) + (sample2.s**2/n2)) ** 2
df.lower.left = (sample1.s**2/n1)**2/(n1-1)
df.lower.right = (sample2.s**2/n2)**2/(n2-1)
df.lower = df.lower.left + df.lower.right

df = df.upper/df.lower					# [1] 67.39422



# Compute t statistics

t.upper = sample1.mean - sample2.mean
t.lower = sqrt(
							 (sample1.s**2/n1) + (sample2.s**2/n2)
)
# It is negative because we are doing a left-tailed test.
sample.t = t.upper/t.lower			# [1] -299.4002

# p-value
pt(sample.t, df)								# [1] 2.560795e-107

# Suppose we use 99 Confidence Interval, p-value here is clearly less than 0.01
# Great, we reject the null. Hence miu_1 < miu_2. It is being verified.


png('figures/t-test_two_mean.png')
x = seq(-5,5, length = 2000)
plot(x,
		 dt(x, df),
		 type = 'l',
		 xlab = 't',
		 ylab = 'density'


)
dev.off()





# Method 2
# Built-in Welch's t-test
t.test(x = sample1, y = sample2, alternative = 'less', conf.level = 0.99)



#	        Welch Two Sample t-test
#	
#	data:  sample1 and sample2
#	t = -8.0105, df = 72.718, p-value = 6.891e-12
#	alternative hypothesis: true difference in means is less than 0
#	99 percent confidence interval:
#	      -Inf -2.405759
#	sample estimates:
#	mean of x mean of y
#	 76.24008  79.66198








## pooled variance

# Syntax: 
# must specify var.equal = T

#	t.test(x = sample1,
#				 y = sample2,
#				 alternative = 'two.sided',
#				 conf.level = 0.95,
#				 var.equal = T
#	)










#----------------
# Paired/Dependent samples

# page 414







#---------------- Chi-square test for categorical variables
### Single categorical variable

lty_index = 2
x = seq(0,15, length = 100)
png('figures/Chi-square_1_5_10.png')
plot(x,
		 dchisq(x, 1),
		 type = 'l'
)

for (i in c(5,10)){
		lines(x,
					dchisq(x, i),
					lty = lty_index,
		)
		lty_index = lty_index + 2
}
legend('topright',
			 legend = c('df = 1', 'df = 5', 'df = 10'),
			 lty = c(1, 2, 4)
)
dev.off()


### Method 1: Write your own chi-square test

## test example:

# Suppose data fall in three categories, 1,2,3.
# step 1: generate data

sample = c(2,3,2,3,2,1,3,3,2,2,3,2,2,2,3,3,3,2,3,2,2,2,1,3,2,2,2,1,2,2,3,2,2,2,2,1,2,1,1,1,2,2,2,3,1,2,1,2,1,2,1,3,3)

n = length(sample)		# [1] 53

# step 2: compute O_i
sample.table = table(sample)
sample.table
		#		sample
		#		 1  2  3	-> category i
		#		11 28 14	-> O_i

# We can also comute the actual pai_i by dividing sample.table by n
# but we don't need to to form the test statistics
pai_i = sample.table/n
pai_i
		#	        1         2         3		-> i
		#	0.2075472 0.5283019 0.2641509		-> pai_i

# step 3: compute pai_0(i), the expected proportion,
pai_i_expected = (1/3)*n		# [1] 17.66667


# step 4: compute test statistics kai^2

kai_sq = sum(
						 (sample.table - pai_i_expected)**2/pai_i_expected
)							# kai_sq = 9.320755


# step 5: compute p-value
# Note, pchisq() give the cumulative prob. from CDF. We need to
# subtract it by 1 to get the area for right tail.

df = 3-1
p_value = 1 - pchisq(kai_sq, df)		#[1] 0.009462891

# Clearly, it is less than 0.001 significant level. We can reject the
# null. The data do not suggest that the proportions of each category
# are same.
# We can also check it by printing out the proportion, pai_i
sample.table/n
#	        1         2         3
#	0.2075472 0.5283019 0.2641509

# Clearly, not the same.


# Now plot the density

x = seq(0,15, length = 100)
png('figures/single_categorical_chisq_test.png')
plot(
		 x,
		 dchisq(x, 3),
		 type = 'l',
		 xlab = 'Chi-square',
		 ylab = 'density(df = 2)',
		 main = 'Chi-square test for single categorical variable'
)
abline(h = c(0), col = 'gray')
abline(v = c(kai_sq), col = 'gray')
dev.off()





### Method 2:
# R has a built-in function for chi-square test.


# NOTICE: this test function require the vector of
#	the obs Frequencies! 
# DO NOT pass raw sample into it.

chisq.test(x = sample.table)

#	        Chi-squared test for given probabilities
#	
#	data:  sample.table
#	X-squared = 9.3208, df = 2, p-value = 0.009463



## If we assume the categories are not uniformly distributed,
# we need to specify the "p" for the assumed proportion we want
# to test.

# null hypo: pai_1 = 0.25, pai_2 = 0.5, pai_3 = 0.25
# alt. hypo: H_0 is incorrect.

chisq.test(x = sample.table, p = c(0.25, 0.5, 0.25))
#        Chi-squared test for given probabilities
#
#data:  sample.table
#X-squared = 0.50943, df = 2, p-value = 0.7751

# Now, we cannot reject the null







### Two categorical variables

# Generate two variables:

sample = matrix(
								c(20,32,8,52,9,72,8,32,16,64,30,12), 4,3,
								dimnames = list(
																c("Injection", 'Tablet','Laser','Herbal'),
																c('None','Partial','Full')
								)
)

#	          None Partial Full
#	Injection   20       9   16
#	Tablet      32      72   64
#	Laser        8       8   30
#	Herbal      52      32   12


## built-in test

chisq.test(x = sample)

#	        Pearson's Chi-squared test
#	
#	data:  sample
#	X-squared = 66.166, df = 6, p-value = 2.492e-12










