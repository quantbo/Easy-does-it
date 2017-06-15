comment("
gen_plots.r:
Generate plots using different random functions.
")

source('gen_points.r')

gen_plots = function() {
	num = 2^12 #Number of points in each plot.
	height = width = 750 #Image dimensions in pixels.
	#A list of random functions.
	functions = c(rexp, runif, rnorm, rcauchy)
	names = c('Exponential', 'Uniform', 'Normal', 'Cauchy')
	#Make sure each function has a name.
	stopifnot(length(functions) == length(names))

	#For each function generate a plot.
	for (ii in 1:length(functions)) {
		filename = paste(names[ii], '.png', sep='')
		png(filename=filename, height=height, width=width)
		#functions is a list; therefore, each element must be accessed with double brackets.
		mat = gen_points(2, num, functions[[ii]])
		main = paste(num, 'points, with ', names[ii], ' coordinates')
		plot(mat, main=main, cex.main=2, cex.axis=2, mgp=c(0, 1.5, 0),
			col=rgb(0, 0.3, 0.5, 1/2), cex=1.5, xlab='', ylab='')
		dev.off()
	}
}
