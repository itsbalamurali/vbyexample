// Writing a basic HTTP server is easy using the
// `net/http` module.
module main

import (
	
	"net/http"
)

// A fundamental concept in `net/http` servers is
// *handlers*. A handler is an object implementing the
// `http.Handler` interface. A common way to write
// a handler is by using the `http.Handlerfn` adapter
// on fntions with the appropriate signature.
fn hello(w http.ResponseWriter, req *http.Request) {

	// fntions serving as handlers take a
	// `http.ResponseWriter` and a `http.Request` as
	// arguments. The response writer is used to fill in the
	// HTTP response. Here our simple response is just
	// "hello\n".
	fmt.Fprintf(w, "hello\n")
}

fn headers(w http.ResponseWriter, req *http.Request) {

	// This handler does something a little more
	// sophisticated by reading all the HTTP request
	// headers and echoing them into the response body.
	for name, headers := range req.Header {
		for _, h := range headers {
			fmt.Fprintf(w, "%v: %v\n", name, h)
		}
	}
}

fn main() {

	// We register our handlers on server routes using the
	// `http.Handlefn` convenience function. It sets up
	// the *default router* in the `net/http` module and
	// takes a function as an argument.
	http.Handlefn("/hello", hello)
	http.Handlefn("/headers", headers)

	// Finally, we call the `ListenAndServe` with the port
	// and a handler. `nil` tells it to use the default
	// router we've just set up.
	http.ListenAndServe(":8090", nil)
}
