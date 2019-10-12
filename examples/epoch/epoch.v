// A common requirement in programs is getting the number
// of seconds, milliseconds, or nanoseconds since the
// [Unix epoch](http://en.wikipedia.org/wiki/Unix_time).
// Here's how to do it in V.

module main

import (
	
	"time"
)

fn main() {

	// Use `time.Now` with `Unix` or `UnixNano` to get
	// elapsed time since the Unix epoch in seconds or
	// nanoseconds, respectively.
	now := time.Now()
	secs := now.Unix()
	nanos := now.UnixNano()
	println(now)

	// Note that there is no `UnixMillis`, so to get the
	// milliseconds since epoch you'll need to manually
	// divide from nanoseconds.
	millis := nanos / 1000000
	println(secs)
	println(millis)
	println(nanos)

	// You can also convert integer seconds or nanoseconds
	// since the epoch into the corresponding `time`.
	println(time.Unix(secs, 0))
	println(time.Unix(0, nanos))
}
