#--------------#	Section 0 Useful functions

### which(obj)
#	obj must be a logical vector
# Given foo, I want to find the index of element == 230

foo = c(1:9,100,230,233)
result = which(foo == 230)
print(result)
# [1] 11

# It return 11, because 230 is the 11th element in foo




# arr.ind in which() 
# arr.ind = False by default.
#Instead of return the index, if arr.ind = TRUE, it will return specific location.
#suppose I want to locate elemnts are equal either 5 or 10 in the array,
#by setting arr.ind = T, each row of the return value is the indexing info of one element.
#e.g., the first row tells us the first element is located at the 2nd row, 2nd column of the 1st matrix (5)
#the second qualified element is located at the 1st row, the 2nd column of the 2nd matrix (10)


foo = array(1:12,dim = c(3,2,2))
print(foo)
#, , 1
#
#     [,1] [,2]
#[1,]    1    4
#[2,]    2    5
#[3,]    3    6
#
#, , 2
#
#     [,1] [,2]
#[1,]    7   10
#[2,]    8   11
#[3,]    9   12

result = which(foo == 5 | foo == 10, arr.ind = T)
print(result)
#     dim1 dim2 dim3
#[1,]    2    2    1
#[2,]    1    2    2














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




### Indexing
#		Remember!! Index starts from 1. Different from python
foo = c(3,4,5,6,7)
first_element = foo[1]
print(first_element)
# [1] 3


# negative indexing value in R is not the last nth element.
# it will generate the sequence without the nth element.
# "-" sign stands for except... Sucks

# Example, this will generate foo without the second value
# foo = c(3,4,5,6,7) 
foo.negative = foo[-2]
print(foo.negative)
# [1] 3 5 6 7




## spliting

# Method 1
# first : last, 	unlike python, the "last" number can be selected.
# Here, foo.1 shows the third to the fifth number in foo.
foo = c(3,4,5,6,7,8)
foo.1 = foo[3:5]
print(foo.1)
# [1] 5 6 7



# Method 2
# specify specific location in a vector.
# I need foo.2 to be the first, the third, and the fifth number in foo
# I can specify the location in a vector c(1,3,5)
# Hence, foo.2 gives me 3,5,7.

foo = c(3,4,5,6,7,8)
foo.2 = foo[c(1,3,5)]
print(foo.2)
# [1] 3 5 7



# Method 3
# Use negative sign to delete specific elements in a vector or sequence.
# Here, I delete the first, the third, and the fifth elements from foo.
# Hence, foo.3 is left with 4,6,8

foo = c(3,4,5,6,7,8)
foo.3 = foo[-c(1,3,5)]
print(foo.3)
# [1] 4 6 8


# Method 4
# Extract elements using relation operators
# Note, it return a list, not a matrix. No more structures
foo = matrix(1:9,3,3)
print(foo)
foo.1 = foo[foo>3]
print(foo.1)





# Method 5
# Extract the element one after the next one.
# T: TRUE, extract this element
# F: FALSE, skip this element
foo = c(1:9)
print(foo)
foo.1 = foo[c(T,F)]
print(foo.1)
# foo: 		[1] 1 2 3 4 5 6 7 8 9
# foo.1:	[1] 1 3 5 7 9












## Modify elements in a vector by indexing
# Here, I want to change the value from the third to the fifth to zero,
# I can assign zero to specific elements by indexing.

# Method 1
foo = c(3,4,50,68,70,8)
foo[3:5] = 0
print(foo)
# [1] 3 4 0 0 0 8


# Method 2
# By using c(), you can assign different values, e.g., c(1,5,2)
# But the must have same number of elements.
foo = c(3,4,50,68,70,8)
foo[3:5] = c(0,0,0)
print(foo)







#--------------# Section 5 Operation within vector
# production
v1 = c(1,2,3,4,5)
v2 = v1*2
print(v2)
# v2: [1]  2  4  6  8 10


v3 = v1 * v2
print(v3)
# v3: [1]  2  8 18 32 50



# product of all elements in the vector.
# Here, 1*2*3 = 6
foo = 1:3
foo.3 = prod(foo)
print(foo.3)
# [1] 6



# addition
v3 = v1 + v2
print(v3)
# v3: [1]  3  6  9 12 15



# production tricks
# foo*c(-1,1,-1) will multiply the first element in foo by -1, multiply the second
# element by 1, and the third one by -1.
# Then, it does the same thing for the next three elements.
# !!! Notice, by using this method, length of foo must be divisible by the length of c().
# Here 9 is divisible by 3
foo = 1:9
# [1] 1 2 3 4 5 6 7 8 9
foo.1 = foo * c(-1,1,-1)
print(foo.1)
# [1] -1  2 -3 -4  5 -6 -7  8 -9






# Summation
foo = 1:9
foo.2 = sum(foo)
print(foo.2)
# [1] 45







#--------------# Section 6 Matrix

### Generate a matrix
# syntax: matrix(obj, nrow = , ncol = , byrow = )


# Method 1
# Default is byrow = FALSE, so that numbers are vertically continuous (col)
matrix.1 = matrix(1:12, nrow = 3, ncol = 4)
print(matrix.1)

#     [,1] [,2] [,3] [,4]
#[1,]    1    4    7   10
#[2,]    2    5    8   11
#[3,]    3    6    9   12




# Method 2
# If I specify byrow = TRUE
matrix.2 = matrix(1:12, nrow = 3, ncol = 4, byrow = TRUE)
print(matrix.2)
#     [,1] [,2] [,3] [,4]
#[1,]    1    2    3    4
#[2,]    5    6    7    8
#[3,]    9   10   11   12




# Method 3
# rbind(obj1, obj2, obj3,...) and cbind()
# rbind() row binding will combine multiple vectors row by row.
# Notice!! It will, by default, use variable names as indxing number.
# Here, vector a,b,c would be each row in matrix.3
a = c(1,2)
b = c(10,20)
c = c(5,6)
matrix.3 = rbind(a,b,c)
print(matrix.3)
#  [,1] [,2]
#a    1    2
#b   10   20
#c    5    6


matrix.3 = rbind(c(1,2),c(10,20),c(5,6))
print(matrix.3)
#     [,1] [,2]
#[1,]    1    2
#[2,]   10   20
#[3,]    5    6


matrix.4 = rbind(c(1,2,4),11:13,c(100,101,102),41:43)
print(matrix.4)
#     [,1] [,2] [,3]
#[1,]    1    2    4
#[2,]   11   12   13
#[3,]  100  101  102
#[4,]   41   42   43




# cbind() would consider vector a,b,c as column vectors

a = c(1,2)
b = c(10,20)
c = c(5,6)
matrix.4 = cbind(a,b,c)
print(matrix.4)

#     a  b c
#[1,] 1 10 5
#[2,] 2 20 6




### Dimension of the matrix. (df.shape in python)
# The shape of the matrix. Return two numbers: rows, columns
# Here, row = 4, columns = 3
matrix.5 = rbind(c(1,2,4),11:13,c(100,101,102),41:43)
dim(matrix.5)
#[1] 4 3


# to get the row number:
# Method 1
# Love this
dim(matrix.5)[1]
# [1] 4


# Method 2
# Fuck this. This method sucks.
nrow(matrix.5)
# [1] 4



# to get the column number:
dim(matrix.5)[2]
ncol(matrix.5)





### Matrix Spliting and Indexing

# Generate a 3 rows, 5 columns matrix
foo = matrix(c(1:15), 3,5, byrow = TRUE)
print(foo)
#     [,1] [,2] [,3] [,4] [,5]
#[1,]    1    2    3    4    5
#[2,]    6    7    8    9   10
#[3,]   11   12   13   14   15





# Indexing by row and col
# 8 is in the second row and the third columns

eight = foo[2,3]
print(eight)
# [1] 8




## Spliting
# Syntax: matrix[row,col]

# Method 1
# If want to extract the second columns, in python df.iloc[:,1]
# Here, 
second.column = foo[,2]
print(second.column)
# foo:
#     [,1] [,2] [,3] [,4] [,5]
#[1,]    1    2    3    4    5
#[2,]    6    7    8    9   10
#[3,]   11   12   13   14   15

# second.column:
# [1]  2  7 12


# Extract column 2 to 4
foo.1 = foo[,2:4]
print(foo.1)
#     [,1] [,2] [,3]
#[1,]    2    3    4
#[2,]    7    8    9
#[3,]   12   13   14




# Method 2
# Specify specific columns or rows using vector
# foo:
#     [,1] [,2] [,3] [,4] [,5]
#[1,]    1    2    3    4    5
#[2,]    6    7    8    9   10
#[3,]   11   12   13   14   15

# Here extract the first and the third row
foo.2 = foo[c(1,3),]
print(foo.2)
#     [,1] [,2] [,3] [,4] [,5]
#[1,]    1    2    3    4    5
#[2,]   11   12   13   14   15






# Method 3:		Extract diagonal values
# This ONLY works for a square matrix.

foo = matrix(1:9, 3,3, byrow = TRUE)
print(foo)
diagonal_value = diag(foo)
print(diagonal_value)
# foo:
#     [,1] [,2] [,3]
#[1,]    1    2    3
#[2,]    4    5    6
#[3,]    7    8    9

# diagonal value:
# [1] 1 5 9



# Method 4
# Extract by remove specific columns or rows, or submatrix
foo = matrix(1:25, 5,5, byrow = TRUE)
print(foo)
#     [,1] [,2] [,3] [,4] [,5]
#[1,]    1    2    3    4    5
#[2,]    6    7    8    9   10
#[3,]   11   12   13   14   15
#[4,]   16   17   18   19   20
#[5,]   21   22   23   24   25

# Suppose I want to extract this submatrix from foo:
# 7    8    9
#12   13   14
#17   18   19
# I can delete 1st and 5th row and columns
foo.1 = foo[-c(1,5),-c(1,5)]
print(foo.1)
#     [,1] [,2] [,3]
#[1,]    7    8    9
#[2,]   12   13   14
#[3,]   17   18   19



### Modify elements in a matrix
# Method 1
#     [,1] [,2] [,3] [,4] [,5]
#[1,]    1    2    3    4    5
#[2,]    6    7    8    9   10
#[3,]   11   12   13   14   15
#[4,]   16   17   18   19   20
#[5,]   21   22   23   24   25
foo = matrix(1:25, 5,5, byrow = TRUE)
print(foo)
# supose I want to change 2, 13,14,18,19 to 100
foo[2,2] = 100
foo[3:4,3:4] = 100
print(foo)
#     [,1] [,2] [,3] [,4] [,5]
#[1,]    1    2    3    4    5
#[2,]    6  100    8    9   10
#[3,]   11   12  100  100   15
#[4,]   16   17  100  100   20
#[5,]   21   22   23   24   25



# Method 2
# LHS locate (1,1),(3,1),(1,3),(3,3) in the matrix
# Then change their values in the order of -7 then 7.
# Hence, 
#	(1,1),(3,1),(1,3),(3,3)
#		7			-7		7			-7
foo[c(1,3),c(1,3)] = c(-7,7)
print(foo)
#     [,1] [,2] [,3] [,4] [,5]
#[1,]   -7    2   -7    4    5
#[2,]    6  100    8    9   10
#[3,]    7   12    7  100   15
#[4,]   16   17  100  100   20
#[5,]   21   22   23   24   25




# Method 3
# Here specify the 1st and 2nd in reverse order, so, overwrite the 2nd column first
# In this order:
# (1,2)	(3,2)	(1,2)	(1,1)
foo[c(1,3),2:1] = c(666,-666,777,-777)
print(foo)







### Matrix Transpose
foo = matrix(1:8, 2,4)
print(foo)
#     [,1] [,2] [,3] [,4]
#[1,]    1    3    5    7
#[2,]    2    4    6    8

foo.trans = t(foo)
print(foo.trans)
#     [,1] [,2]
#[1,]    1    2
#[2,]    3    4
#[3,]    5    6
#[4,]    7    8







### Identity Matrix
# Previously we use diag(matrix) to extract the diagonal value in a matrix.
# Here we use it to create identity matrix.
# diag(n) will generate a n*n identity matrix, where "n" is an positive number.

iden.matrix = diag(4)
print(iden.matrix)
#     [,1] [,2] [,3] [,4]
#[1,]    1    0    0    0
#[2,]    0    1    0    0
#[3,]    0    0    1    0
#[4,]    0    0    0    1





### Matrix Operation

## Matrix multiplication
# ignore scalar production. Too simple.


# Here's how to multiplication among matrices dot() in python
matrix.1 = matrix(1:6, 2,3)
print(matrix.1)
#     [,1] [,2] [,3]
#[1,]    1    3    5
#[2,]    2    4    6
matrix.2 = matrix(1:6, 3,2)
print(matrix.2)
#     [,1] [,2]
#[1,]    1    4
#[2,]    2    5
#[3,]    3    6


matrix.production = matrix.1%*%matrix.2
print(matrix.production)
#     [,1] [,2]
#[1,]   22   49
#[2,]   28   64









## Inverse of a Matrix
# AA^-1 = I
# invertible matrix is also called non-singular matrix. Must be full rank.
# Use Gaussian elimination to solve the matrix first
# solve() will return the inverse of a matrix. You can check if A%*%solve(A) = I
foo = matrix(c(3,4,1,2), 2,2)
print(foo)
#     [,1] [,2]
#[1,]    3    1
#[2,]    4    2
foo.solved = solve(foo)
print(foo.solved)
#     [,1] [,2]
#[1,]    1 -0.5
#[2,]   -2  1.5


print(foo%*%foo.solved)
#     [,1] [,2]
#[1,]    1    0
#[2,]    0    1
# The product is an identity matrix. Nice.







#--------------# Section 7 Multidimensional Array
## Multi-dimensional Array. Consider multidimensional in numpy.

## Array generation
# syntax:
#	array(obj, dim(row,col,dimension))
# length(obj) must be equal to row*col*dimension
ar1 = array(1:24, dim = c(3,4,2))
print(ar1)
#, , 1
#
#     [,1] [,2] [,3] [,4]
#[1,]    1    4    7   10
#[2,]    2    5    8   11
#[3,]    3    6    9   12
#
#, , 2
#
#     [,1] [,2] [,3] [,4]
#[1,]   13   16   19   22
#[2,]   14   17   20   23
#[3,]   15   18   21   24





## Array Slicing 


# syntax:
# array[row,col,dim]
# Suppose I want to extrac 13 from ar1
# 13 is at 1st row, 1st col, and 2nd dimension, hence, ar1[1,1,2]

target = ar1[1,1,2]
print(target)



# Extract submatrix
# leave dim empty means extract from all dimensions
target = ar1[2:3,2:3,]
print(target)

#, , 1
#
#     [,1] [,2]
#[1,]    5    8
#[2,]    6    9
#
#, , 2
#
#     [,1] [,2]
#[1,]   17   20
#[2,]   18   21








#--------------# Section 8 Logical Values

### Bool
## T and F are in short for TRUE and FALSE

a = T
print(a)
# [1] TRUE

b = F
print(b)
# [1] FALSE




### Relation Operators
# same as in python
# 	==
# 	!=
# 	>
# 	<
# 	>=
# 	<=


foo = matrix(1:9, 3,3)
print(foo)
foo>5
#     [,1] [,2] [,3]
#[1,]    1    4    7
#[2,]    2    5    8
#[3,]    3    6    9
#      [,1]  [,2] [,3]
#[1,] FALSE FALSE TRUE
#[2,] FALSE FALSE TRUE
#[3,] FALSE  TRUE TRUE






### Logical Operators
# Same as in python
#		&		and (intersection)
#		&&	and
#		|		or (union)
#		||	or
#		!		not









#--------------# Section 9 Characters
## Length of a string
# length() does not work!! Oh my poor R... python is better.
# Use nchar() to count length of a string


foo = 'hello world'
result = length(foo)
print(result)
# [1] 1

string.length = nchar(foo)
print(string.length)
# [1] 11



# Also, you cannot use string*n to append multiple string behind. What a horrible language...
#	a = 'hi'*2
#	print(a)
#Error in "hi" * 2 : non-numeric argument to binary operator
#Execution halted





### Concatenation

## cat() 
# It delivery the output to console without return any value. It cannot be assign to a variable
cat('hello', 'world')
# hello world%
a = cat('hello', 'world')
print(a)
# hello worldNULL



## paste()
# syntax: paste(obj, sep=)
# sep can be anything to seperate the elements. It is ' ' by default
# It will return the concatenation result to a variable, which is usable!!
a = paste('hello', 'world')
print(a)
# [1] "hello world"

a = paste('hello', 'world', sep = '--')
print(a)
# [1] "hello--world"




## substrings and matching
# you can replace a single words by sub(pattern=, replacement=,obj)
# "replacement" specifies what you want to replace the pattern.
# This function only replace the first matched elements

foo = 'www.baidu.com -- baidu'
a = sub(pattern = 'baidu', replacement = 'sina', x = foo)
print(a)
# [1] "www.sina.com -- baidu"

# Or you can write in a simplier way
b = sub('baidu', 'sina', foo)
print(b)
# [1] "www.sina.com -- baidu"



# If yo want to replace all matched terms, use gsub()
result = gsub('baidu', 'sina', foo)
print(result)
# [1] "www.sina.com -- sina"







