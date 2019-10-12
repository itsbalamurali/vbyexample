# We receive the values `"one"` and then `"two"` as
# expected.
$ time v run select.v 
received one
received two

# Note that the total execution time is only ~2 seconds
# since both the 1 and 2 second `Sleeps` execute
# concurrently.
real	0m2.245s
