// V's _select_ lets you wait on multiple channel
// operations. Combining goroutines and channels with
// select is a powerful feature of V.

module main

import (
	
	"time"
)

fn main() {

	// For our example we'll select across two channels.
	c1 := make(chan string)
	c2 := make(chan string)

	// Each channel will receive a value after some amount
	// of time, to simulate e.g. blocking RPC operations
	// executing in concurrent goroutines.
	go fn() {
		time.Sleep(1 * time.Second)
		c1 <- "one"
	}()
	go fn() {
		time.Sleep(2 * time.Second)
		c2 <- "two"
	}()

	// We'll use `select` to await both of these values
	// simultaneously, printing each one as it arrives.
	for i := 0; i < 2; i++ {
		select {
		case msg1 := <-c1:
			println("received", msg1)
		case msg2 := <-c2:
			println("received", msg2)
		}
	}
}
