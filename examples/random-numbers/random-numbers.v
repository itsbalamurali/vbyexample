// V's `math/rand` module provides
// [pseudorandom number](http://en.wikipedia.org/wiki/Pseudorandom_number_generator)
// generation.

module main

import (
	
	"math/rand"
	"time"
)

fn main() {

	// For example, `rand.Intn` returns a random `int` n,
	// `0 <= n < 100`.
	print(rand.Intn(100), ",")
	print(rand.Intn(100))
	println()

	// `rand.Float64` returns a `float64` `f`,
	// `0.0 <= f < 1.0`.
	println(rand.Float64())

	// This can be used to generate random floats in
	// other ranges, for example `5.0 <= f' < 10.0`.
	print((rand.Float64()*5)+5, ",")
	print((rand.Float64() * 5) + 5)
	println()

	// The default number generator is deterministic, so it'll
	// produce the same sequence of numbers each time by default.
	// To produce varying sequences, give it a seed that changes.
	// Note that this is not safe to use for random numbers you
	// intend to be secret, use `crypto/rand` for those.
	s1 := rand.NewSource(time.Now().UnixNano())
	r1 := rand.New(s1)

	// Call the resulting `rand.Rand` just like the
	// fntions on the `rand` module.
	print(r1.Intn(100), ",")
	print(r1.Intn(100))
	println()

	// If you seed a source with the same number, it
	// produces the same sequence of random numbers.
	s2 := rand.NewSource(42)
	r2 := rand.New(s2)
	print(r2.Intn(100), ",")
	print(r2.Intn(100))
	println()
	s3 := rand.NewSource(42)
	r3 := rand.New(s3)
	print(r3.Intn(100), ",")
	print(r3.Intn(100))
}
