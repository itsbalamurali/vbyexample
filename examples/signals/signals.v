// Sometimes we'd like our V programs to intelligently
// handle [Unix signals](http://en.wikipedia.org/wiki/Unix_signal).
// For example, we might want a server to gracefully
// shutdown when it receives a `SIGTERM`, or a command-line
// tool to stop processing input if it receives a `SIGINT`.
// Here's how to handle signals in V with channels.

module main

import (
	
	"os"
	"os/signal"
	"syscall"
)

fn main() {

	// V signal notification works by sending `os.Signal`
	// values on a channel. We'll create a channel to
	// receive these notifications (we'll also make one to
	// notify us when the program can exit).
	sigs := make(chan os.Signal, 1)
	done := make(chan bool, 1)

	// `signal.Notify` registers the given channel to
	// receive notifications of the specified signals.
	signal.Notify(sigs, syscall.SIGINT, syscall.SIGTERM)

	// This goroutine executes a blocking receive for
	// signals. When it gets one it'll print it out
	// and then notify the program that it can finish.
	go fn() {
		sig := <-sigs
		println()
		println(sig)
		done <- true
	}()

	// The program will wait here until it gets the
	// expected signal (as indicated by the goroutine
	// above sending a value on `done`) and then exit.
	println("awaiting signal")
	<-done
	println("exiting")
}
