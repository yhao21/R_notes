#--------------#	Section 1 Utilities
###	print current path
#		In python: os.getcwd()

getwd() # wd: working directory


### list objects
# this function would list all variables in the program.
ls()

#--------------# Section 2 Arithmetic Operation
### Math Operater

#	2**2 and 2^2 are the same thing. They are equal to 4.
a = 3
b = 2
c = a**b
d = a^b
print(c)


### square root: sqrt()
a = 9
c = sqrt(a)
print(c)


### logarithm
# It tells us the value of log100 based 10, i.e., a = log_{100} 10
a = log(x = 100, base = 10)
print(a)
# default base if natural log, i.e., base = e
# you can check this by
b = log(2)	# natural log 2
c = exp(b)	# you would find exp(log(2)) = 2



### exponential
# exp(x) is e^x. e.g., e^1 = exp(1)
a = exp(1)
print(a)







#--------------# Section 3 Vector
### Create a vector
# use c() to create a vector
v1 = c(1,2,3,4,5)
v2 = c(6,7,8,9,10)
print(v1)

# append a vector to another one
v3 = c(v1,v2)
print(v3)
# v3: [1]  1  2  3  4  5  6  7  8  9 10



### Operation within vector
# product
v1 = c(1,2,3,4,5)
v2 = v1*2
print(v2)
# v2: [1]  2  4  6  8 10

v3 = v1 + v2
print(v3)
# v3: [1]  3  6  9 12 15


v3 = v1 * v2
print(v3)
# v3: [1]  2  8 18 32 50








