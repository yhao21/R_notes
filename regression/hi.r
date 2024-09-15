library(plyr)

#
#Index(['Month', 'Expectation', 'Inflation_current', 'Inflation_month_ago',
#       'D_inf_current', 'D_inf_month_ago', 'Inflation_year_ahead', 'Diff',
#       'Error', 'D_Diff', 'D_Error', 'MoM_adjustment', 'YoY_adjustment',
#       'Expectation_month_ago', 'Expectation_year_ago'],
#


data = read.csv('./michigan_dataset.csv')
#data = data[1:100,]
#
#
#model = lm(Expectation~Inflation_current+Inflation_month_ago, data = data)
#summary(model)
#
#
#                    Estimate Std. Error t value Pr(>|t|)
#(Intercept)           1.1980     0.1595   7.510  2.9e-11 ***
#Inflation_current     0.9212     0.1928   4.777  6.3e-06 ***
#Inflation_month_ago  -0.3015     0.1929  -1.563    0.121
#---
#Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#
#Residual standard error: 0.8459 on 97 degrees of freedom
#Multiple R-squared:  0.9055,    Adjusted R-squared:  0.9036
#F-statistic: 464.9 on 2 and 97 DF,  p-value: < 2.2e-16
#


mylm = function(formula, data, obs, constant = T)
{
		mf = match.call(expand.dots = F)
		m = match(c("formula", "data", "obs"), names(mf), 0L)
		print(names(mf))
		print(m)
		mf = mf[c(1L, m)]
		mf
		mf$drop.unused.levels <- TRUE
		mf[[1L]]
}



mylm('f', data, 100)

