# Running this program will cause it to panic, print
# an error message and goroutine traces, and exit with
# a non-zero status.
$ v run panic.v
panic: a problem

goroutine 1 [running]:
main.main()
	/.../panic.v:12 +0x47
...
exit status 2

# Note that unlike some languages which use exceptions
# for handling of many errors, in V it is idiomatic
# to use error-indicating return values wherever possible.
