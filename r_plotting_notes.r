library(plyr)

#--------------# Section 1 Plot() Data

df = read.csv('data/NewCleanData.csv')
print(head(df))
#  X Open_price Close_price   Volume cir_supply      mktcap
#1 0     767.74      772.53 23448600   12114343  9358693020
#2 1     772.53      825.47 16837800   11408147  9417082760
#3 2     825.47      849.14 54171500   11850128 10062417390
#4 3     849.14      919.41 36344700   11258256 10350952914
#5 4     919.41      936.38 62414600   11969007 11207538944
#6 5     936.38      826.50 88584600   13810529 11414401972

# if you specify nothing, it will export the plotting to a pdf file.
plot(df$Open_price, type = 'l')



### Syntax: plot(x,y,type,main,xlim,ylim,xlab,ylab,sub,asp,lty,lwd,col,pch)
# xlim,ylim: c(a,b)
# main: title of the graph
# type:
# "p":	points
# "l":	lines
# "b":	both
# "h":	histogram
# "s":	stair steps
# lty: 	line type, e.g., solid, dotted, dashed, etc.
#		1: 	solid line
#		2:	dash line
#		3:	high-dense dashed
# lwd:	line width
# col:	color (hex code is allowed)
# pch:	point character. which chr to use for plotting individual points

title = 'Bitcoin Price (log)'
png('figures/lnprice.png')
plot(log(df$Open_price),
		 main = title,
		 xlab = 'time',
		 ylab = 'log price',
		 xlim = c(0,3000),
		 ylim = c(0,13),
		 type = 'l',
		 col = '#03fc88'
)
dev.off()




png('figures/test_plot.png')
plot(c(1,3,5,10,4,14),
		 pch = 15,	# different point style
		 lty = 4,
		 type = 'b'	# use both point and line
)
dev.off()






#---------- Add points, lines, and text to a plot

# points		add points
# lines			add lines
# ablines		add lines
# segments	add lines
# text			write text
# arrows		add arrows
# legend		add a legend



### add lines using lines()


#Plot Beta pdf with various value of parameters
x = seq(0,1, length = 10000)
png('figures/Beta_pdf.png')
plot(
		 x,
		 dbeta(x,14,14),
		 type = 'l'
)
lines(
		 x,
		 dbeta(x,1,4),
		 type = 'l'
)
dev.off()





###	abline
png('figures/plot_abline.png')
plot(c(1,3,5,10,4,14),
		 pch = 15,	# different point style
		 lty = 4,
		 type = 'b'	# use both point and line
)
abline(h = c(4,10), # draw line at y = 4 and y = 10
			 col = 'red',
			 lty = 2,
			 lwd = 3
)
dev.off()




### segments
# segments in need x0 y0 x1 y1
# it draw line from coordinate(x0,y0) to (x1,y1)


## Draw one line
# Here I want to draw a line from (2,4) to (2,10)
png('figures/plot_segments1.png')
plot(c(1,3,5,10,4,14),
		 pch = 15,	# different point style
		 lty = 4,
		 type = 'b'	# use both point and line
)
segments(
				 x0 = 2,
				 y0 = 4,
				 x1 = 2,
				 y1 = 10,
				 col = 'blue',
				 lty = 3,
				 lwd = 1
)
dev.off()




## Draw multiple lines
# Suppose I want to draw lines:
#			 x0 y0     x1 y1
# from (2,4) to (2,10)
# from (5,4) to (5,10)
# I can use vector to specify x0 y0 x1 y1

png('figures/plot_segments2.png')
plot(c(1,3,5,10,4,14),
		 pch = 15,	# different point style
		 lty = 4,
		 type = 'b'	# use both point and line
)
segments(
				 x0 = c(2,5),
				 y0 = c(4,4),
				 x1 = c(2,5),
				 y1 = c(10,10),
				 col = 'blue',
				 lty = 3,
				 lwd = 1
)
dev.off()






#--------------# Plot log scale
# Same as Dwyer's plot.
# Use level data, rescale to log, you have log scale on the vertical axis
# But it still present the level value.
df = read.csv("data/NewCleanData.csv")
print(head(df))

lnprice = log(df$Open_price)

png('figures/log_scale_price.png')
plot(df$Open_price,
		 type = 'l',
		 main = 'Bitcoin Price (log)',
		 log = 'y'
)
dev.off()







#--------------# Section 2 ggplot() Data
library("ggplot2")

# Syntax:
# qplot(x,y,main,xlab,ylab,xlim,ylim,...)




# qplot(x, y), both must be specified, like plt.plot(x,y)
png('figures/try_ggplot.png')
qplot(1:6, c(1,3,5,10,4,14))
dev.off()













#--------------# Section 3 Barplots, Pie charts
df = read.csv('data/NewCleanData.csv')

price_classification = function(RV){
		result_list = c()
		for(x in RV){
				if(x < 1000){
						result_list = c(result_list, 1)
				} else if(x >= 1000 & x < 10000){
						result_list = c(result_list, 2)
				}	else if(x >= 10000){
						result_list = c(result_list, 3)
				}
		}
		return (result_list)
}


price_range = price_classification(df$Open_price)

df = cbind(df, price_range)
print(head(df))





#----------------- barplot
# barplot for price range
# we have price range, then we need to count the frequency, and make
# barplot. Note, argument for barplot() must be a vector or a matrix!!!
# Hence, we cannot use count() from plyr.

price_range_fre = table(df$price_range)


png('figures/price_range.png')
barplot(price_range_fre,
				main = 'Price range',
				names.arg = c('low', 'medium', 'high')
)
dev.off()









#----------------- Pie chart

png('figures/price_range_pie.png')
pie(price_range_fre,
		main = 'Price range',
		col = c('gray', 'white', 'black'),
		labels = c('low', 'medium', 'high')
)
dev.off()








#----------------- Histograms
# make sure the max value in the histogram is greater than the max value
# in your dataset!!

max(df$Open_price)
# [1] 40816

png('figures/price_range_histogram_15intervals.png')
hist(df$Open_price,
		 # recall seq() sequence function, seq(start, end, step)
		 # here step means interval values, if step = 6, then, threshold
		 # would be 0,6,12,....
		 # this is not the same as in python!
		 # if you want to generate exact amount out intervals, use length.out
		 # seq(0,42000, length.out = 8) gives you 8 intervals.
		 #breaks = seq(0,42000,6),
		 breaks = seq(0,50000,10000),
		 #breaks = seq(0,42000,length.out = 15),
		 col = 'gray',
		 main = 'BTC price',
		 xlab = 'Intervals',
		 ylab = 'Price'

)
dev.off()






#----------------- Boxplot

png('figures/price_range_box.png')
boxplot(df$Open_price,
				main = 'Price range'
)
dev.off()



### multiple box in a plot.
png('figures/info_box.png')
boxplot(df$cir_supply,
				df$Volume,
				main = 'BTC INFO'
)
dev.off()







#----------------- Scatter Plot

price = df$Open_price
png('figures/BTC_scatter.png')
plot(df$Volume, price,
		 type = 'p',
		 xlab = 'Volume',
		 ylab = 'supply'
)

dev.off()










#----------------- Matrix of Plots
png('figures/BTC_matrix_plot.png')
pairs(df[,2:6],
			col = df$price_range
)
dev.off()










#--------------#	Plot data with date on the horizontal axis


df = read.csv('data/BTC_with_date.csv')
print(head(df))



# Note, here '%Y-%m-%d' specify the form of the date in your data.
# It must be in the same form of your raw data, o.w., it would return
# NA. For example, the date info in your data is in the following form:
# 2021-05-20
# Then you must specify '%Y-%m-%d' in the as.Date()

png('figures/plot_with_data.png')
df$Date = as.Date(df$Date, '%Y-%m-%d')
# xaxt: axes and text
plot(Open_price~Date, df, xaxt = 'n', type = 'l')
axis(1, df$Date, format(df$Date, '%b %d'), cex.axis = .7)
dev.off()





















