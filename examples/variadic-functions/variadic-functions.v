// [_Variadic fntions_](http://en.wikipedia.org/wiki/Variadic_fntion)
// can be called with any number of trailing arguments.
// For example, `println` is a common variadic
// function.

module main



// Here's a function that will take an arbitrary number
// of `int`s as arguments.
fn sum(nums ...int) {
	print(nums, " ")
	total := 0
	for _, num := range nums {
		total += num
	}
	println(total)
}

fn main() {

	// Variadic fntions can be called in the usual way
	// with individual arguments.
	sum(1, 2)
	sum(1, 2, 3)

	// If you already have multiple args in a slice,
	// apply them to a variadic function using
	// `fn(slice...)` like this.
	nums := []int{1, 2, 3, 4}
	sum(nums...)
}
