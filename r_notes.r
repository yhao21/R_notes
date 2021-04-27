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



#--------------# Section 4 Sequence
### Different ways to create a sequence:

## Method 1
#		seq(from, to, by), by:= step
# 	seq.1 and seq.2 are exactly the same!
seq.1 = seq(from = 3, to = 27, by = 3)
seq.2 = seq(3,27,3)
print(seq.1)
# [1]  3  6  9 12 15 18 21 24 27




## Method 2
#		seq(from, to, length.out)
#		length.out specifies how many number would be generated in this sequence
#		It will generate 40 numbers from 3 to 27 with same step among them.
seq.3 = seq(3,27, length.out = 40)
print(seq.3)

# [1]  3.000000  3.615385  4.230769  4.846154  5.461538  6.076923  6.692308
# [8]  7.307692  7.923077  8.538462  9.153846  9.769231 10.384615 11.000000
#[15] 11.615385 12.230769 12.846154 13.461538 14.076923 14.692308 15.307692
#[22] 15.923077 16.538462 17.153846 17.769231 18.384615 19.000000 19.615385
#[29] 20.230769 20.846154 21.461538 22.076923 22.692308 23.307692 23.923077
#[36] 24.538462 25.153846 25.769231 26.384615 27.000000




## Method 3
#		Generate a decreasing sequence
#		Since this is a decreasing seq, by value must be negative.
#		seq.4 and seq.5 are exactly the same
seq.4 = seq(from = 100, to = 1, by = -20)
seq.5 = seq(100,1,-20)
print(seq.4)
print(seq.5)
#[1] 100  80  60  40  20




## Method 4
#		You can use operations when specifying from and to values
seq.6 = seq(from = 2*4, to = 10*2, length.out = 3*5)
print(seq.6)
# [1]  8.000000  8.857143  9.714286 10.571429 11.428571 12.285714 13.142857
# [8] 14.000000 14.857143 15.714286 16.571429 17.428571 18.285714 19.142857
#[15] 20.000000





## Method 5.1 
#		You can generate a repetition with rep()
#		rep(pattern_obj, behaviors)
#		behaviours:
#			times:	how many times you want to repeat the obj
#			each:		how many times you want to repeat each element within a repetition round.
#		"each" has higher priority than "times." The program will do "each" first, then "times"

rep.1 = rep(x = 1, times = 4)
print(rep.1)
# [1] 1 1 1 1

# The default behaviors is "times"
rep.2 = rep(5,4)
print(rep.2)
# [1] 5 5 5 5



## Method 5.2
#		If the pattern_obj is a vector, rep(,time) will repeat this vector two times
rep.3 = rep(c(1,2,3),times = 2)
print(rep.3)
# [1] 1 2 3 1 2 3




## Method 5.3
# "each" will repeat each element n times within a repetition.
rep.4 = rep(c(1,2,3), each = 2)
print(rep.4)
# [1] 1 1 2 2 3 3




## Method 5.4
#		"each" has higher priority than "times." The program will do "each" first, then "times"
rep.5 = rep(c(1,2,3), each = 2, times = 3)
print(rep.5)
# [1] 1 1 2 2 3 3 1 1 2 2 3 3 1 1 2 2 3 3



## Method 6
# You can generate a vector by using all the above techniques together
#	the "vector" will consider rep() and seq() as the 4th and the 5th element of the vector
foo.1 = c(6,1,8, rep(c(3,4,5),each = 2, times = 2), seq(3,6,length.out = 10))
print(foo.1)

# [1] 6.000000 1.000000 8.000000 3.000000 3.000000 4.000000 4.000000 5.000000
# [9] 5.000000 3.000000 3.000000 4.000000 4.000000 5.000000 5.000000 3.000000
#[17] 3.333333 3.666667 4.000000 4.333333 4.666667 5.000000 5.333333 5.666667
#[25] 6.000000



## Method 7
# Some special tricks
seq.7 = 1:10
print(seq.7)
# [1]  1  2  3  4  5  6  7  8  9 10








###	Sorting
# sort(obj, decreasing = TRUE/FALSE)
foo = c(3,100,20,38)
sort.1 = sort(foo, decreasing = TRUE)
print(sort.1)
# [1] 100  38  20   3

sort.2 = sort(foo, decreasing = FALSE)
print(sort.2)
# [1]   3  20  38 100


# Default value: increasing
sort.3 = sort(foo)
print(sort.3)
# [1]   3  20  38 100




### Length of a vector
# length(obj)		R can not use len(), Sucks...
foo = 1:10
foo.length = length(foo)
print(foo.length)
# [1] 10





