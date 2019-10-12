// V supports _methods_ defined on struct types.

module main



type rect struct {
	width, height int
}

// This `area` method has a _receiver type_ of `*rect`.
fn (r *rect) area() int {
	return r.width * r.height
}

// Methods can be defined for either pointer or value
// receiver types. Here's an example of a value receiver.
fn (r rect) perim() int {
	return 2*r.width + 2*r.height
}

fn main() {
	r := rect{width: 10, height: 5}

	// Here we call the 2 methods defined for our struct.
	println("area: ", r.area())
	println("perim:", r.perim())

	// V automatically handles conversion between values
	// and pointers for method calls. You may want to use
	// a pointer receiver type to avoid copying on method
	// calls or to allow the method to mutate the
	// receiving struct.
	rp := &r
	println("area: ", rp.area())
	println("perim:", rp.perim())
}
