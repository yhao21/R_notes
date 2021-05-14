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






#--------------#	Dummy with multiple levels

# For dummy variable with multiple levels, e.g., high school, college,
# master, phd, are all under edu.
# R by default will choose one level as a baseline. 
# For example, in the upper case, R will choose college as baseline
# becasue college starts with letter 'c'. In alphabet, c,h,m,p.
# If you want to manually change the baseline level, you can use:
# 
# new_order = relevel(df$target_column, ref = 'Your baseline level')

# new_order = relevel(survey$Smoke, ref = 'Never')
# this would set 'Never' as baseline level.


# Change in the order will have different values in the coefs, but it
# will not affect the general result of the regression.


# Notice!! If your data is numeric, you have to convert it into factor,
# otherwise, R will consider it as a continuous variable! Then your
# regression is useless.




#--------------#	Standardize your data

# transformed data = (data - mean)/sd

print(head(df))
price = df$Open_price
volume = df$Volume
supply = df$cir_supply

std_data = function(mydata){
		# R is diff from python, you must use return(obj) rather return obj
		return ((mydata - mean(mydata))/sd(mydata))
}


norm_price = std_data(price)
norm_volume = std_data(volume)
norm_supply = std_data(supply)


norm_lm_result = lm(norm_price~norm_volume+norm_supply)
summary(norm_lm_result)
# You can see, after normalize the data, the result looks better.

# Call:
# lm(formula = norm_price ~ norm_volume + norm_supply)
# 
# Residuals:
#     Min      1Q  Median      3Q     Max
# -2.8385 -0.3761 -0.1154  0.2332  4.3151
# 
# Coefficients:
#               Estimate Std. Error t value Pr(>|t|)
# (Intercept) -1.288e-16  1.248e-02    0.00        1
# norm_volume  4.771e-01  1.573e-02   30.34   <2e-16 ***
# norm_supply  3.852e-01  1.573e-02   24.49   <2e-16 ***
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 0.633 on 2570 degrees of freedom
# Multiple R-squared:  0.5996,    Adjusted R-squared:  0.5993
# F-statistic:  1924 on 2 and 2570 DF,  p-value: < 2.2e-16




###--------### Get the Coefs of the regression

coefs = coef(norm_lm_result)

#   (Intercept)   norm_volume   norm_supply
# -1.288402e-16  4.771264e-01  3.851733e-01
print(coefs[1])
#   (Intercept)
# -1.288402e-16


# Print R2 score
r2_score = summary(norm_lm_result)$r.squared
print(r2_score)		# [1] 0.5996023




#--------------#	Add polynomial terms


# form the normalized dataset
df = data.frame(norm_price, norm_volume, norm_supply)
print(head(df))

#You can envoke an arithmetic calculation in the lm() function by 
#using: I() function
# Suppose I want to add a square term in the regression

lm_poly_result = lm(norm_price~norm_volume+norm_supply+I(norm_supply**2),
										data = df)
summary(lm_poly_result)

# Call:
# lm(formula = norm_price ~ norm_volume + norm_supply + I(norm_supply^2),data = df)
# 
# Residuals:
#     Min      1Q  Median      3Q     Max
# -3.8409 -0.3641 -0.1123  0.2159  4.2778
# 
# Coefficients:
#                   Estimate Std. Error t value Pr(>|t|)
# (Intercept)      -0.024260   0.015931  -1.523   0.1279
# norm_volume       0.465420   0.016424  28.338   <2e-16 ***
# norm_supply       0.397987   0.016562  24.030   <2e-16 ***
# I(norm_supply^2)  0.024269   0.009922   2.446   0.0145 *
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 0.6324 on 2569 degrees of freedom
# Multiple R-squared:  0.6005,    Adjusted R-squared:  0.6001
# F-statistic:  1287 on 3 and 2569 DF,  p-value: < 2.2e-16



### It doesn't look goode by add one quadratic term, let's add a cubic
### term

lm_poly_result = lm(norm_price~norm_volume+norm_supply+I(norm_supply**2)+I(norm_supply**3),
										data = df)
summary(lm_poly_result)

# Now it looks great.

# Call:
# lm(formula = norm_price ~ norm_volume + norm_supply + I(norm_supply^2)
# +
#     I(norm_supply^3), data = df)
# 
# Residuals:
#     Min      1Q  Median      3Q     Max
# -2.6915 -0.3253 -0.0681  0.1157  4.2444
# 
# Coefficients:
#                   Estimate Std. Error t value Pr(>|t|)
# (Intercept)      -0.095378   0.017162  -5.557 3.02e-08 ***
# norm_volume       0.418280   0.016785  24.920  < 2e-16 ***
# norm_supply       0.525587   0.020633  25.473  < 2e-16 ***
# I(norm_supply^2)  0.088337   0.011642   7.588 4.52e-14 ***
# I(norm_supply^3) -0.030171   0.003007 -10.035  < 2e-16 ***
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 0.6205 on 2568 degrees of freedom
# Multiple R-squared:  0.6156,    Adjusted R-squared:  0.615
# F-statistic:  1028 on 4 and 2568 DF,  p-value: < 2.2e-16









#--------------#	Interaction terms


## Use ":" represent interaction operation, e.g., variable1:variable2
## stands for variable1 * variable2

inter_lm_result = lm(
		norm_price~norm_volume+norm_supply+norm_volume:norm_supply,
		data = df
)
summary(inter_lm_result)



#		Call:
#		lm(formula = norm_price ~ norm_volume + norm_supply + norm_volume:norm_
#		supply,
#		    data = df)
#		
#		Residuals:
#		    Min      1Q  Median      3Q     Max
#		-2.4287 -0.3767 -0.1075  0.2357  4.5384
#		
#		Coefficients:
#		                        Estimate Std. Error t value Pr(>|t|)
#		(Intercept)              0.05447    0.01854   2.938  0.00333 **
#		norm_volume              0.57832    0.02996  19.305  < 2e-16 ***
#		norm_supply              0.33805    0.01968  17.179  < 2e-16 ***
#		norm_volume:norm_supply -0.08957    0.02259  -3.964 7.56e-05 ***
#		---
#		Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#		
#		Residual standard error: 0.6312 on 2569 degrees of freedom
#		Multiple R-squared:  0.602,     Adjusted R-squared:  0.6016
#		F-statistic:  1295 on 3 and 2569 DF,  p-value: < 2.2e-16






# Or you can use variable1*variable2, SAME!
# VR1*VR2 = VR1+VR2+VR1:VR2


result = lm(norm_price~norm_supply*norm_volume, data = df)
summary(result)
# Call:
# lm(formula = norm_price ~ norm_supply * norm_volume, data = df)
# 
# Residuals:
#     Min      1Q  Median      3Q     Max
# -2.4287 -0.3767 -0.1075  0.2357  4.5384
# 
# Coefficients:
#                         Estimate Std. Error t value Pr(>|t|)
# (Intercept)              0.05447    0.01854   2.938  0.00333 **
# norm_supply              0.33805    0.01968  17.179  < 2e-16 ***
# norm_volume              0.57832    0.02996  19.305  < 2e-16 ***
# norm_supply:norm_volume -0.08957    0.02259  -3.964 7.56e-05 ***
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 0.6312 on 2569 degrees of freedom
# Multiple R-squared:  0.602,     Adjusted R-squared:  0.6016
# F-statistic:  1295 on 3 and 2569 DF,  p-value: < 2.2e-16










