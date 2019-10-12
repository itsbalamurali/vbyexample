// [_Command-line arguments_](http://en.wikipedia.org/wiki/Command-line_interface#Arguments)
// are a common way to parameterize execution of programs.
// For example, `v run hello.v` uses `run` and
// `hello.v` arguments to the `go` program.

module main

import (
	
	"os"
)

fn main() {

	// `os.Args` provides access to raw command-line
	// arguments. Note that the first value in this slice
	// is the path to the program, and `os.Args[1:]`
	// holds the arguments to the program.
	argsWithProg := os.Args
	argsWithoutProg := os.Args[1:]

	// You can get individual args with normal indexing.
	arg := os.Args[3]

	println(argsWithProg)
	println(argsWithoutProg)
	println(arg)
}
