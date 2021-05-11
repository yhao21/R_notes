library('MASS')




df = read.csv('data/NewCleanData.csv')
print(head(df))



# another way to specify x and y in plot() 
# plot(VR1~VR2)
# It plots variable 1(VR1) on the vertical axis as a dependent variable
# and plot VR2 on the horizontal axis as a explanatory variable.
png('figures/LM_plot_price_volume.png')
plot(df$Open_price~df$Volume,
		 xlab = 'volume',
		 ylab = 'price'
)
dev.off()



### Correlation

# cor(y,x,use = 'complete.obs')
# complete.obs will guarantee that R will not use obs with NA.

cor(df$Open_price, df$Volume, use = 'complete.obs')

# [1] 0.7114399




#--------------#	Fit Linear Model
# lm(formula, data), lm := linear model

# You don't need to specify df$Open_price, as long as you specify the
# data are from df

result = lm(Open_price~Volume, df)
print(result)
summary(result)

# Call:
# lm(formula = Open_price ~ Volume, data = df)
# 
# Residuals:
#    Min     1Q Median     3Q    Max
# -17567  -2112  -1594   1821  22878
# 
# Coefficients:
#              Estimate Std. Error t value Pr(>|t|)
# (Intercept) 2.342e+03  8.799e+01   26.62   <2e-16 ***
# Volume      2.696e-07  5.252e-09   51.33   <2e-16 ***
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 3803 on 2571 degrees of freedom
# Multiple R-squared:  0.5061,    Adjusted R-squared:  0.506
# F-statistic:  2635 on 1 and 2571 DF,  p-value: < 2.2e-16



# then we can add this regression line to the graph.



png('figures/LM_plot_price_volume.png')
plot(df$Open_price~df$Volume,
		 xlab = 'volume',
		 ylab = 'price'
)
abline(result, lwd = 2)
dev.off()




## Now we can compute the confidence interval using confint()
# syntax:
# confint(regression_result, level = )

confint(result, level = 0.95)

#                    2.5 %       97.5 %
# (Intercept) 2.169422e+03 2.514506e+03
# Volume      2.593195e-07 2.799183e-07


# This is the CI for beta. Hence, although it is significant, but
# volume has very little effect on the price.






# compute correlation then square it.
cor(df$Open_price, df$Volume, use = 'complete.obs')**2
# [1] 0.5061467








#--------------#	Dummy variable

df = read.csv('data/NewCleanData.csv')
print(head(df))


# Here, x = 1 if today's volume is higher than yesterdays, 0 O.W.
# Let's see if the change of volume would affect the price.

png('figures/vol_change_price.png')
plot(Open_price~vol_change, 
		 data = df,
		 xlab = 'volume change',
		 ylab = 'price'
)
dev.off()

# Seem like no relation
# Let's do regression,


price_vol_regression = lm(Open_price~vol_change, data = df)
summary(price_vol_regression)

# Coefficients:
#             Estimate Std. Error t value Pr(>|t|)
# (Intercept)   4640.4      145.9  31.801   <2e-16 ***
# vol_change     142.3      213.8   0.666    0.506
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 5411 on 2571 degrees of freedom
# Multiple R-squared:  0.0001723, Adjusted R-squared:  -0.0002166
# F-statistic: 0.4431 on 1 and 2571 DF,  p-value: 0.5057



# Clearly, no effect

















