// A _goroutine_ is a lightweight thread of execution.

module main

import (
	
	"time"
)

fn f(from string) {
	for i := 0; i < 3; i++ {
		println(from, ":", i)
	}
}

fn main() {

	// Suppose we have a function call `f(s)`. Here's how
	// we'd call that in the usual way, running it
	// synchronously.
	f("direct")

	// To invoke this function in a goroutine, use
	// `go f(s)`. This new goroutine will execute
	// concurrently with the calling one.
	go f("goroutine")

	// You can also start a goroutine for an anonymous
	// function call.
	go fn(msg string) {
		println(msg)
	}("going")

	// Our two function calls are running asynchronously in
	// separate goroutines now. Wait for them to finish
	// (for a more robust approach, use a [WaitGroup](waitgroups)).
	time.Sleep(time.Second)
	println("done")
}
