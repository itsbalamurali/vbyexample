// V offers built-in support for [regular expressions](http://en.wikipedia.org/wiki/Regular_expression).
// Here are some examples of  common regexp-related tasks
// in V.

module main

import (
	"bytes"
	
	"regexp"
)

fn main() {

	// This tests whether a pattern matches a string.
	match, _ := regexp.MatchString("p([a-z]+)ch", "peach")
	println(match)

	// Above we used a string pattern directly, but for
	// other regexp tasks you'll need to `Compile` an
	// optimized `Regexp` struct.
	r, _ := regexp.Compile("p([a-z]+)ch")

	// Many methods are available on these structs. Here's
	// a match test like we saw earlier.
	println(r.MatchString("peach"))

	// This finds the match for the regexp.
	println(r.FindString("peach punch"))

	// This also finds the first match but returns the
	// start and end indexes for the match instead of the
	// matching text.
	println(r.FindStringIndex("peach punch"))

	// The `Submatch` variants include information about
	// both the whole-pattern matches and the submatches
	// within those matches. For example this will return
	// information for both `p([a-z]+)ch` and `([a-z]+)`.
	println(r.FindStringSubmatch("peach punch"))

	// Similarly this will return information about the
	// indexes of matches and submatches.
	println(r.FindStringSubmatchIndex("peach punch"))

	// The `All` variants of these fntions apply to all
	// matches in the input, not just the first. For
	// example to find all matches for a regexp.
	println(r.FindAllString("peach punch pinch", -1))

	// These `All` variants are available for the other
	// fntions we saw above as well.
	println(r.FindAllStringSubmatchIndex(
		"peach punch pinch", -1))

	// Providing a non-negative integer as the second
	// argument to these fntions will limit the number
	// of matches.
	println(r.FindAllString("peach punch pinch", 2))

	// Our examples above had string arguments and used
	// names like `MatchString`. We can also provide
	// `[]byte` arguments and drop `String` from the
	// function name.
	println(r.Match([]byte("peach")))

	// When creating constants with regular expressions
	// you can use the `MustCompile` variation of
	// `Compile`. A plain `Compile` won't work for
	// constants because it has 2 return values.
	r = regexp.MustCompile("p([a-z]+)ch")
	println(r)

	// The `regexp` module can also be used to replace
	// subsets of strings with other values.
	println(r.ReplaceAllString("a peach", "<fruit>"))

	// The `fn` variant allows you to transform matched
	// text with a given function.
	in := []byte("a peach")
	out := r.ReplaceAllfn(in, bytes.ToUpper)
	println(string(out))
}
