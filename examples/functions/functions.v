// _fntions_ are central in V. We'll learn about
// fntions with a few different examples.

module main



// Here's a function that takes two `int`s and returns
// their sum as an `int`.
fn plus(a int, b int) int {

	// V requires explicit returns, i.e. it won't
	// automatically return the value of the last
	// expression.
	return a + b
}

// When you have multiple consecutive parameters of
// the same type, you may omit the type name for the
// like-typed parameters up to the final parameter that
// declares the type.
fn plusPlus(a, b, c int) int {
	return a + b + c
}

fn main() {

	// Call a function just as you'd expect, with
	// `name(args)`.
	res := plus(1, 2)
	println("1+2 =", res)

	res = plusPlus(1, 2, 3)
	println("1+2+3 =", res)
}
