$ echo "hello" > /tmp/dat
$ echo "go" >>   /tmp/dat
$ v run reading-files.v
hello
go
5 bytes: hello
2 bytes @ 6: go
2 bytes @ 6: go
5 bytes: hello

# Next we'll look at writing files.
