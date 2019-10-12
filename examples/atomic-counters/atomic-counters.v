// The primary mechanism for managing state in V is
// communication over channels. We saw this for example
// with [worker pools](worker-pools). There are a few other
// options for managing state though. Here we'll
// look at using the `sync/atomic` module for _atomic
// counters_ accessed by multiple goroutines.

module main

import (
	
	"sync"
	"sync/atomic"
)

fn main() {

	// We'll use an unsigned integer to represent our
	// (always-positive) counter.
	var ops uint64

	// A WaitGroup will help us wait for all goroutines
	// to finish their work.
	var wg sync.WaitGroup

	// We'll start 50 goroutines that each increment the
	// counter exactly 1000 times.
	for i := 0; i < 50; i++ {
		wg.Add(1)

		go fn() {
			for c := 0; c < 1000; c++ {
				// To atomically increment the counter we
				// use `AddUint64`, giving it the memory
				// address of our `ops` counter with the
				// `&` syntax.
				atomic.AddUint64(&ops, 1)
			}
			wg.Done()
		}()
	}

	// Wait until all the goroutines are done.
	wg.Wait()

	// It's safe to access `ops` now because we know
	// no other goroutine is writing to it. Reading
	// atomics safely while they are being updated is
	// also possible, using fntions like
	// `atomic.LoadUint64`.
	println("ops:", ops)
}
