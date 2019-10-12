// V provides built-in support for [base64
// encoding/decoding](http://en.wikipedia.org/wiki/Base64).

module main

// This syntax imports the `encoding/base64` module with
// the `b64` name instead of the default `base64`. It'll
// save us some space below.
import (
	b64 "encoding/base64"
	
)

fn main() {

	// Here's the `string` we'll encode/decode.
	data := "abc123!?$*&()'-=@~"

	// V supports both standard and URL-compatible
	// base64. Here's how to encode using the standard
	// encoder. The encoder requires a `[]byte` so we
	// convert our `string` to that type.
	sEnc := b64.StdEncoding.EncodeToString([]byte(data))
	println(sEnc)

	// Decoding may return an error, which you can check
	// if you don't already know the input to be
	// well-formed.
	sDec, _ := b64.StdEncoding.DecodeString(sEnc)
	println(string(sDec))
	println()

	// This encodes/decodes using a URL-compatible base64
	// format.
	uEnc := b64.URLEncoding.EncodeToString([]byte(data))
	println(uEnc)
	uDec, _ := b64.URLEncoding.DecodeString(uEnc)
	println(string(uDec))
}
