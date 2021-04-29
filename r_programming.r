#--------------#	if statement

#		if(){
#			statements...
#		}

a = 1
b = 3
if(a < b){
	print('a less than b')
}
# [1] "a less than b"







#--------------#	if else 
# Note, you cannot place else{} in a separate line.
#		if(condition){
#			statement
#		}else{
#			statement
#		}


a = 0
b = 3

if(a>b){
	print('hello world')
}else{
	print('OMG')
}
# [1] "OMG"







#--------------#	if,else if, else

#		if(condition){
#			statement
#		} else if(condition){
#			statement
#		} else{
#			statement
#		}



a = 3
b = 0
c = 5

if(a < b){
	print('a1')
} else if(a < c){
	print('a2')
} else{
	print('OMG')
}
# [1] "a2"








#--------------#	for loop
#		for(condition){
#			action
#		}


a = c(1:3)

for(i in a){
	print(i)
}
#[1] 1
#[1] 2
#[1] 3







#--------------#	while loop
#		while(condition){
#			statement
#		}
a = 10
while(a >5){
	print(a)
	a = a - 1
}


#--------------#	apply()
#		apply(x = obj, MARGIN = , FUN = )
#			MARGIN = 1	row
#			MARGIN = 1	column
#			MARGIN = 1	layers
#			MARGIN = 1	blocks
#			...
#			FUN can be any function


### Application 1

foo = matrix(1:10, 2,5)
print(foo)
#	     [,1] [,2] [,3] [,4] [,5]
#	[1,]    1    3    5    7    9
#	[2,]    2    4    6    8   10


# use apply to calculate the sum of each column:
col_sum = apply(foo, MARGIN = 2, FUN = sum)
print(col_sum)
# [1]  3  7 11 15 19


# Use apply() to sum each row
row_sum = apply(foo,1,sum)
print(row_sum)
# [1] 25 30



### Application 2
# extract the diagonal values from an array

foo = array(1:18, dim = c(3,3,2))
print(foo)
#	, , 1
#	
#	     [,1] [,2] [,3]
#	[1,]    1    4    7
#	[2,]    2    5    8
#	[3,]    3    6    9
#	
#	, , 2
#	
#	     [,1] [,2] [,3]
#	[1,]   10   13   16
#	[2,]   11   14   17
#	[3,]   12   15   18



# The diagonal values for the first subset is (1,5,8)
# The diagonal values for the second subset is (10,14,18)
# Let's extract these two using apply()

# Margin = 3 stands for layers. 
result = apply(foo, 3, diag)
print(result)
# Present in col
#      [,1] [,2]
# [1,]    1   10
# [2,]    5   14
# [3,]    9   18
print(t(result))
# Present in row
#     [,1] [,2] [,3]
#[1,]    1    5    9
#[2,]   10   14   18












