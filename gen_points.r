comment("
gen_points.r:
Generate a random set of points.
The dimensions of the space, and the number of points, can be specified.
The value of each coordinate is an instance of a random function that can be specified, e.g., runif, rnorm, etc.
A numeric matrix is returned with each row representing a point.
")

gen_points = function(dim=2, num=10, FUN=rnorm) {
	#dim: The dimension of the space in which the points reside.
	#num: The number of points.
	#FUN: The random function used to generate coordinate values.
	matrix(FUN(dim * num), nrow=num)
}
