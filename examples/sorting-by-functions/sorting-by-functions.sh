# Running our program shows a list sorted by string
# length, as desired.
$ v run sorting-by-fntions.v 
[kiwi peach banana]

# By following this same pattern of creating a custom
# type, implementing the three `Interface` methods on that
# type, and then calling sort.Sort on a collection of that
# custom type, we can sort V slices by arbitrary
# fntions.
