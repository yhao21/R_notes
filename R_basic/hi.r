################################################
###			Data Structure: Vector, Matrix, Array, Data Frame, List
################################################

################################################
###--------### Vector: use the combine function c() to form the vector
################################################

#a = c(1,2,'one', 'c')


################################################
###--------### Matrix: two-dimensional array. 
################################################

###---DEF---###: matrix(vector, nrow = num of rows, ncol = num of cols, byrow = logical_value (Default = False), dimnames = list(vector_of_row_names, vector_of_col_names))

                 # matrix_one = matrix(1:20, nrow = 4, ncol = 5)
                 # matrix_one
                 # 
                 #                                     #     [,1] [,2] [,3] [,4] [,5]
                 #                                     #[1,]    1    5    9   13   17
                 #                                     #[2,]    2    6   10   14   18
                 #                                     #[3,]    3    7   11   15   19
                 #                                     #[4,]    4    8   12   16   20
                 # 
                 # matrix_two = matrix(c(1,2,4,5,2,1,2,3), nrow = 2, ncol = 4)
                 # matrix_two
                 # 
                 #                                     #
                 #                                     #     [,1] [,2] [,3] [,4]
                 #                                     #[1,]    1    4    2    2
                 #                                     #[2,]    2    5    1    3
                 #                                     #
                 # 
                 # 
                 # rnames = c('R1', 'R2')
                 # cnames = c('C1', 'C2')
                 # matrix_three = matrix(1:4, nrow = 2, ncol = 2, byrow = T, dimnames = list(rnames, cnames))
                 # matrix_three
                 # 
                 #                                     #
                 #                                     #   C1 C2
                 #                                     #R1  1  2
                 #                                     #R2  3  4
                 #                                     #
                 # 
                 # 

################################################
###--------### Array: it can have more than two dimensions.
################################################

###---DEF---###: array(vector, dimensions = c(nrow, ncol, ...), dimnames = list(row, col, ...))

                 # dim1 = c('R1', 'R2')
                 # dim2 = c('C1', 'C2', 'C3')
                 # dim3 = c('D1', 'D2', 'D3', 'D4')
                 # array_one = array(1:24, c(2,3,4), dimnames = list(dim1, dim2, dim3))
                 # array_one
                 # 
                 #                                # 
                 #                                # , , D1
                 #                                # 
                 #                                #    C1 C2 C3
                 #                                # R1  1  3  5
                 #                                # R2  2  4  6
                 #                                # 
                 #                                # , , D2
                 #                                # 
                 #                                #    C1 C2 C3
                 #                                # R1  7  9 11
                 #                                # R2  8 10 12
                 #                                # 
                 #                                # , , D3
                 #                                # 
                 #                                #    C1 C2 C3
                 #                                # R1 13 15 17
                 #                                # R2 14 16 18
                 #                                # 
                 #                                # , , D4
                 #                                # 
                 #                                #    C1 C2 C3
                 #                                # R1 19 21 23
                 #                                # R2 20 22 24
                 #                                # 
                 #                                # 
                 # 



################################################
###--------### Data frame
################################################
####---DEF---###: data.frame(col1, col2, ....)
                 #name = c('Yan', 'Yun')
                 #age = c(30, 27)
                 #a = data.frame(name, age)
                 #
                 #                                 #  name age
                 #                                 #1  Yan  30
                 #                                 #2  Yun  27
                 #
####---DEF---###: with function: with(<dataframe>, {...})
                #with(a, 
                #		 {
                #				 summary(age)
                #		 }
                #)
                #                                 #
                #                                 #   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
                #                                 #  27.00   27.75   28.50   28.50   29.25   30.00
                #
                #with(a, 
                #		 {
                #				 summary(age)
                #				 age
                #		 }
                #)
                #                                 # Only the last action will be 
                #                                 # [1] 30 27






#--------------#	Change column names using colnames(obj) = c(col1, col2, ...)

                   #df = data.frame(matrix(1:12, ncol = 3))
                   #df
                   #                           #   X1 X2 X3
                   #                           # 1  1  5  9
                   #                           # 2  2  6 10
                   #                           # 3  3  7 11
                   #                           # 4  4  8 12
                   #
                   #colnames(df) = c('x', 'y', 'z')
                   #df
                   #                           #   x y  z
                   #                           # 1 1 5  9
                   #                           # 2 2 6 10
                   #                           # 3 3 7 11
                   #                           # 4 4 8 12
                   #
                   #
                   ##It can also be used for matrix, ...
                   #a = matrix(1:12, nrow = 4)
                   #a
                   #                           #      [,1] [,2] [,3]
                   #                           # [1,]    1    5    9
                   #                           # [2,]    2    6   10
                   #                           # [3,]    3    7   11
                   #                           # [4,]    4    8   12
                   #
                   #colnames(a) = c('x', 'y', 'z')
                   #a
                   #                           #      x y  z
                   #                           # [1,] 1 5  9
                   #                           # [2,] 2 6 10
                   #                           # [3,] 3 7 11
                   #                           # [4,] 4 8 12
                   #


#--------------#	computation among columnswithin a new dataframe using transform() function
###---DEF---###: transfor(dataframe, newcol1 = , newcol2 = , ...)
#
                   # 
                   # df = data.frame(matrix(1:12, nrow = 4))
                   # colnames(df) = c('price', 'quantity', 'z')
                   #                             #   price quantity  z 
                   #                             # 1     1        5  9 
                   #                             # 2     2        6 10 
                   #                             # 3     3        7 11 
                   #                             # 4     4        8 12 
                   # 
                   # new_df = transform(df,
                   # 									mkt_value = price*quantity
                   # )
                   # 
                   #                             #   price quantity  z mkt_value
                   #                             # 1     1        5  9         5
                   #                             # 2     2        6 10        12
                   #                             # 3     3        7 11        21
                   #                             # 4     4        8 12        32
                   # 
                   # 
                   







#
################################################
###--------------#	Indexing
################################################


################################################
###--------------#	 Vector indexing
################################################

              # a = c(1,2,3,4,5,6,7,8,9)
              # a[c(1,4,6)] #	find multiple elements using c()
              # 						# Result: [1] 1 4 6
              # 
              # 
              # a[1:4]      # find the first four elements
              # 						# Result: [1] 1 2 3 4
              # 
              # 
              # 
################################################
###--------------#	Matrix indexing
################################################

              # matrix_one = matrix(1:20, nrow = 4, ncol = 5)
              # matrix_one[1,]			# Get the first row of the matrix
              # matrix_one[,1]			# Get the first column of the matrix
              # 













##==========================================================================================================


################################################
###--------------#	Data input
################################################


###---DEF---###:   read.table(<path-of-file>, header, sep, row.names, col.names, na.strings, colClasses, ...)

                   #Example:
                   #
                   #df = read.table("XXX.csv", header = T, colClasses = c('character', 'character', 'numeric'))
                   #





################################################
###--------------#	Useful functions for working with data objects
################################################

####---DEF---###: length(obj) gives the number of 
                #a = 'okay'
                ## length(a)			[1] 1               Gives the num of elements/components
                ## dim(a)        NULL
                ## str(a)         chr "okay"         Gives the structure of an obj
                ## class(a)      [1] "character"     Gives the class of an obj
                ## mode(a)       [1] "character"     Determines how an obj is stored
                ## names(a)      NULL                Gives the names of components in an obj
                #
                #
                #
                #b = 'hello'
                #
                #rbind(a, b) # combines objs as rows
                #
                #            #   [,1]
                #            # a "okay"
                #            # b "hello"
                #
                #
                #cbind(a,b)  # combines objs as columns
                #            #      a      b
                #            # [1,] "okay" "hello"
                #
                #
                #
                #head() list the first part of an obj
                #tail() list the last part of an obj










##==========================================================================================================
##            Basic data management
##==========================================================================================================


################################################
###--------------#	Math operator
################################################

#   ^ or **  Exponentiation 
#   x %% y   Modulus (x mod y), e.g., 5%%2 = 1
#   x %/% y  Integer division, e.g., 5 %/% 2 = 2



df = data.frame(matrix(1:12, nrow = 4))
colnames(df) = c('price', 'quantity', 'z')

new_df = transform(df,
									mkt_value = price*quantity
)

new_df








