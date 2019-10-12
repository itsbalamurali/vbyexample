// The V standard library comes with excellent support
// for HTTP clients and servers in the `net/http`
// module. In this example we'll use it to issue simple
// HTTP requests.
module main

import (
	"bufio"
	
	"net/http"
)

fn main() {

	// Issue an HTTP GET request to a server. `http.Get` is a
	// convenient shortcut around creating an `http.Client`
	// object and calling its `Get` method; it uses the
	// `http.DefaultClient` object which has useful default
	// settings.
	resp, err := http.Get("http://gobyexample.com")
	if err != nil {
		panic(err)
	}
	defer resp.Body.Close()

	// Print the HTTP response status.
	println("Response status:", resp.Status)

	// Print the first 5 lines of the response body.
	scanner := bufio.NewScanner(resp.Body)
	for i := 0; scanner.Scan() && i < 5; i++ {
		println(scanner.Text())
	}

	if err := scanner.Err(); err != nil {
		panic(err)
	}
}
