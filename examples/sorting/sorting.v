// V's `sort` module implements sorting for builtins
// and user-defined types. We'll look at sorting for
// builtins first.

module main

import (
	
	"sort"
)

fn main() {

	// Sort methods are specific to the builtin type;
	// here's an example for strings. Note that sorting is
	// in-place, so it changes the given slice and doesn't
	// return a new one.
	strs := []string{"c", "a", "b"}
	sort.Strings(strs)
	println("Strings:", strs)

	// An example of sorting `int`s.
	ints := []int{7, 2, 4}
	sort.Ints(ints)
	println("Ints:   ", ints)

	// We can also use `sort` to check if a slice is
	// already in sorted order.
	s := sort.IntsAreSorted(ints)
	println("Sorted: ", s)
}
