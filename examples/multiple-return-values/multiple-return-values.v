// V has built-in support for _multiple return values_.
// This feature is used often in idiomatic V, for example
// to return both result and error values from a function.

module main



// The `(int, int)` in this function signature shows that
// the function returns 2 `int`s.
fn vals() (int, int) {
	return 3, 7
}

fn main() {

	// Here we use the 2 different return values from the
	// call with _multiple assignment_.
	a, b := vals()
	println(a)
	println(b)

	// If you only want a subset of the returned values,
	// use the blank identifier `_`.
	_, c := vals()
	println(c)
}
