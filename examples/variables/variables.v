// In V, _variables_ are explicitly declared and used by
// the compiler to e.g. check type-correctness of function
// calls.

module main


fn main() {

	// `var` declares 1 or more variables.
	var a = "initial"
	println(a)

	// You can declare multiple variables at once.
	var b, c int = 1, 2
	println(b, c)

	// V will infer the type of initialized variables.
	var d = true
	println(d)

	// Variables declared without a corresponding
	// initialization are _zero-valued_. For example, the
	// zero value for an `int` is `0`.
	var e int
	println(e)

	// The `:=` syntax is shorthand for declaring and
	// initializing a variable, e.g. for
	// `var f string = "apple"` in this case.
	f := "apple"
	println(f)
}
