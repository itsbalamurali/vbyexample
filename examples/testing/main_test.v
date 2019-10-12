// Unit testing is an important part of writing
// principled V programs. The `testing` module
// provides the tools we need to write unit tests
// and the `v test` command runs tests.

// For the sake of demonstration, this code is in module
// `main`, but it could be any module. Testing code
// typically lives in the same module as the code it tests.
module main

import (
	
	"testing"
)

// We'll be testing this simple implementation of an
// integer minimum. Typically, the code we're testing
// would be in a source file named something like
// `intutils.v`, and the test file for it would then
// be named `intutils_test.v`.
fn IntMin(a, b int) int {
	if a < b {
		return a
	} else {
		return b
	}
}

// A test is created by writing a function with a name
// beginning with `Test`.
fn TestIntMinBasic(t *testing.T) {
	ans := IntMin(2, -2)
	if ans != -2 {
		// `t.Error*` will report test failures but continue
		// executing the test. `t.Fail*` will report test
		// failures and stop the test immediately.
		t.Errorf("IntMin(2, -2) = %d; want -2", ans)
	}
}

// Writing tests can be repetitive, so it's idiomatic to
// use a *table-driven style*, where test inputs and
// expected outputs are listed in a table and a single loop
// walks over them and performs the test logic.
fn TestIntMinTableDriven(t *testing.T) {
	var tests = []struct {
		a, b int
		want int
	}{
		{0, 1, 0},
		{1, 0, 0},
		{2, -2, -2},
		{0, -1, -1},
		{-1, 0, -1},
	}

	for _, tt := range tests {
		// t.Run enables running "subtests", one for each
		// table entry. These are shown separately
		// when executing `go test -v`.
		testname := fmt.Sprintf("%d,%d", tt.a, tt.b)
		t.Run(testname, fn(t *testing.T) {
			ans := IntMin(tt.a, tt.b)
			if ans != tt.want {
				t.Errorf("got %d, want %d", ans, tt.want)
			}
		})
	}
}
