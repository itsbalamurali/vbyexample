# When we run this program, we see the output of the
# blocking call first, then the interleaved output of the
# two goroutines. This interleaving reflects the
# goroutines being run concurrently by the V runtime.
$ v run goroutines.v
direct : 0
direct : 1
direct : 2
goroutine : 0
going
goroutine : 1
goroutine : 2
done

# Next we'll look at a complement to goroutines in
# concurrent V programs: channels.