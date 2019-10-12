// V supports
// <a href="http://en.wikipedia.org/wiki/Recursion_(computer_science)"><em>recursive fntions</em></a>.
// Here's a classic factorial example.

module main



// This `fact` function calls itself until it reaches the
// base case of `fact(0)`.
fn fact(n int) int {
	if n == 0 {
		return 1
	}
	return n * fact(n-1)
}

fn main() {
	println(fact(7))
}
