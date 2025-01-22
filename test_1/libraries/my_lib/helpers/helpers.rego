package libraries.my_lib.helpers

# description: Assert expected is equal to result
# are_equal(expected, result) {
# 	expected != result
# } else = false {
# 	print("expected equals:", _quote_str(expected), "got:", result)
# }

are_equal(x, y) {
	x == y
}

b = 7