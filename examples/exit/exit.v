// Use `os.Exit` to immediately exit with a given
// status.

module main

import (
	
	"os"
)

fn main() {

	// `defer`s will _not_ be run when using `os.Exit`, so
	// this `println` will never be called.
	defer println("!")

	// Exit with status 3.
	os.Exit(3)
}

// Note that unlike e.g. C, V does not use an integer
// return value from `main` to indicate exit status. If
// you'd like to exit with a non-zero status you should
// use `os.Exit`.
