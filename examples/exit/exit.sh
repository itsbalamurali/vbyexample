#  If you run `exit.v` using `v run`, the exit
# will be picked up by `go` and printed.
$ v run exit.v
exit status 3

# By building and executing a binary you can see
# the status in the terminal.
$ go build exit.v
$ ./exit
$ echo $?
3

# Note that the `!` from our program never got printed.
