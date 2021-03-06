# To try out our line filter, first make a file with a few
# lowercase lines.
$ echo 'hello'   > /tmp/lines
$ echo 'filter' >> /tmp/lines

# Then use the line filter to get uppercase lines.
$ cat /tmp/lines | v run line-filters.v
HELLO
FILTER
