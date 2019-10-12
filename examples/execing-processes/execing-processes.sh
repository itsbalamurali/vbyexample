# When we run our program it is replaced by `ls`.
$ v run execing-processes.v
total 16
drwxr-xr-x  4 mark 136B Oct 3 16:29 .
drwxr-xr-x 91 mark 3.0K Oct 3 12:50 ..
-rw-r--r--  1 mark 1.3K Oct 3 16:28 execing-processes.v

# Note that V does not offer a classic Unix `fork`
# function. Usually this isn't an issue though, since
# starting goroutines, spawning processes, and exec'ing
# processes covers most use cases for `fork`.
