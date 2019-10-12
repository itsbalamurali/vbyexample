// We can use channels to synchronize execution
// across goroutines. Here's an example of using a
// blocking receive to wait for a goroutine to finish.
// When waiting for multiple goroutines to finish,
// you may prefer to use a [WaitGroup](waitgroups).

module main

import (
	
	"time"
)

// This is the function we'll run in a goroutine. The
// `done` channel will be used to notify another
// goroutine that this function's work is done.
fn worker(done chan bool) {
	print("working...")
	time.Sleep(time.Second)
	println("done")

	// Send a value to notify that we're done.
	done <- true
}

fn main() {

	// Start a worker goroutine, giving it the channel to
	// notify on.
	done := make(chan bool, 1)
	go worker(done)

	// Block until we receive a notification from the
	// worker on the channel.
	<-done
}
