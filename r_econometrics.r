
#--------------#	Probability models

### Binomial model

# the probablity of get 4 of rolling a dice = 1/6
# Then, the prob. of rolling 8 times and get 5 4s is 0.0041...

result = dbinom(x = 5, size = 8, prob = 1/6)
print(result)
# [1] 0.004167619






# We can also compute the prob. for each case, i.e., get one 4, two 4s, ...
results = dbinom(x = 0:8, size = 8, prob = 1/6)
print(results)
# [1] 2.325680e-01 3.721089e-01 2.604762e-01 1.041905e-01 2.604762e-02
# [6] 4.167619e-03 4.167619e-04 2.381497e-05 5.953742e-07

# sum of the prob. = 1
sum(results)
# [1] 1



# pbinom(p = , size = , prob = )
# Compute the prob. of at least three 4s, i.e., Pr(X >= 3) = 1-Pr(X<2)
# Here we use pbinom(q = obj, size = , prob = )

pbinom(q = 5, size = 8, prob = 1/6)




# plot probablities
#png('figures/prob_of_8.png')
#barplot(results,
#				names.arg = 0:8,
#				space = 0,
#				ylab = 'Prob(X = x)',
#				xlab = 'x'
#)
#dev.off()








