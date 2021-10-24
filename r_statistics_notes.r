library(plyr)


#--------------#	Summary Statistics

## Let's use bitcoin's price data as an example
df = read.csv('data/btc-2020-5-2-2013-4-28.csv')
print(head(df))

png('figures/btc_his_price.png')
title = 'BTC Price 2013-04-28 to 2020-05-02'
plot(df$price,
		 main = title,
		 type = 'l',
		 log = 'y'
)
dev.off()







#------------------
### Counts, percentage, and proportions

# plyr provide a count() function to do counts.


foo = data.frame(
								 name = c('adam','harry','synferlo','james','xie','zoe'),
								 gender = c(rep('M',5),'F')
)
print(foo)


# Now use count() to get the frequences of gender
# count(df_obj, col)

foo.freq = count(foo, 'gender')
print(foo.freq)
#   gender freq
# 1      F    1
# 2      M    5



# R also have a built in function to do this:
# table(obj), it will return a table of frequency
gender.fre = table(foo$gender)
print(gender.fre)
# F M
# 1 5












#------------------
### quantile
# quantitle(obj, prob = )
# "prob" can be a number, or a vector.

price = df$price
price.quantiles = quantile(price, prob = c(0, 0.25, 0.5, 0.75, 1))
print(price.quantiles)
#       0%       25%       50%       75%      100%
#   67.809   423.925  1408.445  8182.252 63576.676



# If I want to see the 85 percentile,
price.80per = quantile(price, prob = 0.8)
print(price.80per)
#      80%
# 9168.794



### summary()

price.summary = summary(price)
print(price.summary)
#    Min.  1st Qu.   Median     Mean  3rd Qu.     Max.
#   67.81   423.92  1408.44  5953.75  8182.25 63576.68









#------------------
### Statistical Measurements

foo = 1:9
mean(foo)
# [1] 5
mean(df$price)
# [1] 5953.746

# return max and min value, you can also use min() or max() separately.
range(foo)
# [1] 1 9


median(foo)
# [1] 5



### variance, and std deviation
# std. dev = var^(1/2)

price.var = var(df$price)
print(price.var)
# [1] 102994775


price.std.var = sd(df$price)
print(price.std.var)
# [1] 10148.63


# interquartile range(IQR)
# IQR = Q(0.75) - Q(0.25), where Q() stands for quantile function.
price.iqr = IQR(df$price)
print(price.iqr)
# [1] 7758.327










#------------------
### Covariance and Correlation

df1 = read.csv('data/NewCleanData.csv')
print(head(df1))
price = df1$Open_price
vol = df1$Volume

price_vol.cov = cov(price, vol)
print(price_vol.cov)
# they are highly related
# [1] 5.494953e+13


# Correlation
price_vol.cor = cor(price, vol)
print(price_vol.cor)
# [1] 0.7114399










