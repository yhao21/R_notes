
#--------------# Section 1 Plot() Data

df = read.csv('NewCleanData.csv')
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







#--------------# Section 2 ggplot() Data
library("ggplot2")

# Syntax:
# qplot(x,y,main,xlab,ylab,xlim,ylim,...)




# qplot(x, y), both must be specified, like plt.plot(x,y)
png('figures/try_ggplot.png')
qplot(1:6, c(1,3,5,10,4,14))
dev.off()
















