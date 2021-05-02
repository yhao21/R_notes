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







#--------------#	Repeat Statement
#		repeat{
#			statement
#		}

# program will repeat the statements until you specify a break condition.


### Try Fibonacci sequence

fib.a = 1
fib.b = 1
result = c(fib.a,fib.b)




repeat{
	temp = fib.a + fib.b
	fib.a = fib.b
	fib.b = temp
	result = c(result, fib.b)
	if(fib.b > 200){
				break
	}
}

print(result)











#--------------#	Function
#		func_name = functio(arg1, arg2, ...){
#			statements
#			return()
#		}

fib = function(first_value, second_value, result_list){
		# don't forget to use repeat{} for iteration!!
		repeat{
				temp = first_value + second_value
				first_value = second_value
				second_value = temp
				result_list = c(result_list, second_value)
				print(second_value)
				
				if (second_value > 200) {
						break
				}
		}

		return(result_list)
}

result_list = c(1,1)
a = fib(1,1, result_list)
print(a)







### We can also use "..." (ellipsis) to pass more customized arguments

filbplot = function(max_value, plotit = T, ...){
		fibseq = c(1,1)
		counter = 2

		repeat{
				fibseq = c(fibseq, fibseq[counter - 1] + fibseq[counter])
				counter = counter + 1
				print(c(counter, fibseq[counter]))
				if (fibseq[counter] > max_value) {
						break
				}
		}

		if(plotit){
				# Here I can pass more args to customize the plot.
				png('figures/fibseq.png')
				plot(1:length(fibseq), fibseq, ...)
				dev.off()
				return(fibseq)
		} else {
				return(fibseq)
		}
}

title = 'fibplot_below_200'
result = filbplot(500,
									main = title,
									xlab = 'ith number',
									ylab = 'fib value',
									col = 'blue'
)
print(result)







### helper function
# It is nothing but another function defined externally or internally.

## External helper function:

ext_helper_func = function(a,b){
		result = a + b
		return(result)
}

addition_calculator = function(a,b,c){
		pre_cal = ext_helper_func(a,b)
		final_result = c + pre_cal
		print(final_result)
}


# Clearly, ext_helper_func do 1+2 = 3, then final_result = 3+3 = 6
addition_calculator(1,2,3)
# [1] 6




## Internal helpher function:
# Note, you don't need to define the internal function before you call it. This is different with python.



addition_calculator = function(a,b,c){
		pre_cal = ext_helper_func(a,b)
		final_result = c + pre_cal
		print(final_result)

		ext_helper_func = function(a,b){
				result = a + b
				return(result)
		}
}


addition_calculator(2,2,3)
# [1] 7







### disposable function (anonymous function, lambda in python)

# recall rep(obj, repeat_time)
rep(1:3, 2)
# [1] 1 2 3 1 2 3

# we can define a disposable function in apply()

foo = matrix(1:9, 3,3)
print(foo)
#     [,1] [,2] [,3]
#[1,]    1    4    7
#[2,]    2    5    8
#[3,]    3    6    9


# recall margin = 2 meant column behavior.
# like lambda in python, here x stands for each column in foo.
# we want to replicate each column one time.
apply(foo, MARGIN = 2, FUN = function(x){rep(x,2)})
#     [,1] [,2] [,3]
#[1,]    1    4    7
#[2,]    2    5    8
#[3,]    3    6    9
#[4,]    1    4    7
#[5,]    2    5    8
#[6,]    3    6    9












#--------------#	Warning Function
# similar as warning or "assert" in python


compare_integer = function(a,b){
		if (!is.integer(a) & !is.integer(b)){
				print('inputs must be an integer')
		} 

		if (a > b){
				print("a is greater than b")
		} else{
				print(" a is less than b")
		}

}


compare_integer(4.5,5.5)
# The above function, the program will not stop even if it detects a
# non-integer input. You can use "if else statement" to fix this.
# See below.





compare_integer = function(a,b){
		if (!is.integer(a) & !is.integer(b)){
				print('inputs must be an integer')
		} else{
				if (a > b){
						print("a is greater than b")
				} else{
						print(" a is less than b")
				}
		}

}


compare_integer(4.5,5.5)
# [1] "inputs must be an integer"



### Or you can use warning function
# By using warning function, you DO NOT need to use "else". 
# The program will generate a formal warning/error message if the
# condition is not satisfied.

compare_integer = function(a,b){
		if (!is.integer(a) & !is.integer(b)){
				warning('inputs must be an integer')
		} 

		if (a > b){
				print("a is greater than b")
		} else{
				print(" a is less than b")
		}

}


compare_integer(4.5,5.5)
# Warning message:
# In compare_integer(4.5, 5.5) : inputs must be an integer









### try() function to skip error.
# It is similar to try...except in python
# try() allows your program to skip the error part and finish the entire
# program, then return the warning message at last:

try(compare_integer(4.5,5.5), silent = T)
# [1] " a is less than b"
# Warning message:
# In compare_integer(4.5, 5.5) : inputs must be an integer




#	Even though try(obj_func, silent = T) allows you to finish the program,
#	you will still receive the error message.
#	If you DO NOT want to receive any error message, use suppressWarnings()


suppressWarnings(compare_integer(4.5, 5.5))
# [1] " a is less than b"

























