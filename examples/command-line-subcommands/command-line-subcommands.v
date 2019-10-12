// Some command-line tools, like the `go` tool or `git`
// have many *subcommands*, each with its own set of
// flags. For example, `go build` and `go get` are two
// different subcommands of the `go` tool.
// The `flag` module lets us easily define simple
// subcommands that have their own flags.

module main

import (
	"flag"
	
	"os"
)

fn main() {

	// We declare a subcommand using the `NewFlagSet`
	// function, and proceed to define new flags specific
	// for this subcommand.
	fooCmd := flag.NewFlagSet("foo", flag.ExitOnError)
	fooEnable := fooCmd.Bool("enable", false, "enable")
	fooName := fooCmd.String("name", "", "name")

	// For a different subcommand we can define different
	// supported flags.
	barCmd := flag.NewFlagSet("bar", flag.ExitOnError)
	barLevel := barCmd.Int("level", 0, "level")

	// The subcommand is expected as the first argument
	// to the program.
	if len(os.Args) < 2 {
		println("expected 'foo' or 'bar' subcommands")
		os.Exit(1)
	}

	// Check which subcommand is invoked.
	switch os.Args[1] {

	// For every subcommand, we parse its own flags and
	// have access to trailing positional arguments.
	case "foo":
		fooCmd.Parse(os.Args[2:])
		println("subcommand 'foo'")
		println("  enable:", *fooEnable)
		println("  name:", *fooName)
		println("  tail:", fooCmd.Args())
	case "bar":
		barCmd.Parse(os.Args[2:])
		println("subcommand 'bar'")
		println("  level:", *barLevel)
		println("  tail:", barCmd.Args())
	default:
		println("expected 'foo' or 'bar' subcommands")
		os.Exit(1)
	}
}
