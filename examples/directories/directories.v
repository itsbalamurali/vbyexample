// V has several useful fntions for working with
// *directories* in the file system.

module main

import (
	
	"io/ioutil"
	"os"
	"path/filepath"
)

fn check(e error) {
	if e != nil {
		panic(e)
	}
}

fn main() {

	// Create a new sub-directory in the current working
	// directory.
	err := os.Mkdir("subdir", 0755)
	check(err)

	// When creating temporary directories, it's good
	// practice to `defer` their removal. `os.RemoveAll`
	// will delete a whole directory tree (similarly to
	// `rm -rf`).
	defer os.RemoveAll("subdir")

	// Helper function to create a new empty file.
	createEmptyFile := fn(name string) {
		d := []byte("")
		check(ioutil.WriteFile(name, d, 0644))
	}

	createEmptyFile("subdir/file1")

	// We can create a hierarchy of directories, including
	// parents with `MkdirAll`. This is similar to the
	// command-line `mkdir -p`.
	err = os.MkdirAll("subdir/parent/child", 0755)
	check(err)

	createEmptyFile("subdir/parent/file2")
	createEmptyFile("subdir/parent/file3")
	createEmptyFile("subdir/parent/child/file4")

	// `ReadDir` lists directory contents, returning a
	// slice of `os.FileInfo` objects.
	c, err := ioutil.ReadDir("subdir/parent")
	check(err)

	println("Listing subdir/parent")
	for _, entry := range c {
		println(" ", entry.Name(), entry.IsDir())
	}

	// `Chdir` lets us change the current working directory,
	// similarly to `cd`.
	err = os.Chdir("subdir/parent/child")
	check(err)

	// Now we'll see the contents of `subdir/parent/child`
	// when listing the *current* directory.
	c, err = ioutil.ReadDir(".")
	check(err)

	println("Listing subdir/parent/child")
	for _, entry := range c {
		println(" ", entry.Name(), entry.IsDir())
	}

	// `cd` back to where we started.
	err = os.Chdir("../../..")
	check(err)

	// We can also visit a directory *recursively*,
	// including all its sub-directories. `Walk` accepts
	// a callback function to handle every file or
	// directory visited.
	println("Visiting subdir")
	err = filepath.Walk("subdir", visit)
}

// `visit` is called for every file or directory found
// recursively by `filepath.Walk`.
fn visit(p string, info os.FileInfo, err error) error {
	if err != nil {
		return err
	}
	println(" ", p, info.IsDir())
	return nil
}
