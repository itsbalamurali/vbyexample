// V supports <em><a href="http://en.wikipedia.org/wiki/Pointer_(computer_programming)">pointers</a></em>,
// allowing you to pass references to values and records
// within your program.

module main



// We'll show how pointers work in contrast to values with
// 2 fntions: `zeroval` and `zeroptr`. `zeroval` has an
// `int` parameter, so arguments will be passed to it by
// value. `zeroval` will get a copy of `ival` distinct
// from the one in the calling function.
fn zeroval(ival int) {
	ival = 0
}

// `zeroptr` in contrast has an `*int` parameter, meaning
// that it takes an `int` pointer. The `*iptr` code in the
// function body then _dereferences_ the pointer from its
// memory address to the current value at that address.
// Assigning a value to a dereferenced pointer changes the
// value at the referenced address.
fn zeroptr(iptr *int) {
	*iptr = 0
}

fn main() {
	i := 1
	println("initial:", i)

	zeroval(i)
	println("zeroval:", i)

	// The `&i` syntax gives the memory address of `i`,
	// i.e. a pointer to `i`.
	zeroptr(&i)
	println("zeroptr:", i)

	// Pointers can be printed too.
	println("pointer:", &i)
}
