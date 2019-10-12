// _Switch statements_ express conditionals across many
// branches.

module main

import (
	
	"time"
)

fn main() {

	// Here's a basic `switch`.
	i := 2
	print("Write ", i, " as ")
	switch i {
	case 1:
		println("one")
	case 2:
		println("two")
	case 3:
		println("three")
	}

	// You can use commas to separate multiple expressions
	// in the same `case` statement. We use the optional
	// `default` case in this example as well.
	switch time.Now().Weekday() {
	case time.Saturday, time.Sunday:
		println("It's the weekend")
	default:
		println("It's a weekday")
	}

	// `switch` without an expression is an alternate way
	// to express if/else logic. Here we also show how the
	// `case` expressions can be non-constants.
	t := time.Now()
	switch {
	case t.Hour() < 12:
		println("It's before noon")
	default:
		println("It's after noon")
	}

	// A type `switch` compares types instead of values.  You
	// can use this to discover the type of an interface
	// value.  In this example, the variable `t` will have the
	// type corresponding to its clause.
	whatAmI := fn(i interface{}) {
		switch t := i.(type) {
		case bool:
			println("I'm a bool")
		case int:
			println("I'm an int")
		default:
			fmt.Printf("Don't know type %T\n", t)
		}
	}
	whatAmI(true)
	whatAmI(1)
	whatAmI("hey")
}
