// _Defer_ is used to ensure that a function call is
// performed later in a program's execution, usually for
// purposes of cleanup. `defer` is often used where e.g.
// `ensure` and `finally` would be used in other languages.

module main

import (
	
	"os"
)

// Suppose we wanted to create a file, write to it,
// and then close when we're done. Here's how we could
// do that with `defer`.
fn main() {

	// Immediately after getting a file object with
	// `createFile`, we defer the closing of that file
	// with `closeFile`. This will be executed at the end
	// of the enclosing function (`main`), after
	// `writeFile` has finished.
	f := createFile("/tmp/defer.txt")
	defer closeFile(f)
	writeFile(f)
}

fn createFile(p string) *os.File {
	println("creating")
	f, err := os.Create(p)
	if err != nil {
		panic(err)
	}
	return f
}

fn writeFile(f *os.File) {
	println("writing")
	fmt.Fprintln(f, "data")

}

fn closeFile(f *os.File) {
	println("closing")
	err := f.Close()
	// It's important to check for errors when closing a
	// file, even in a deferred function.
	if err != nil {
		fmt.Fprintf(os.Stderr, "error: %v\n", err)
		os.Exit(1)
	}
}
