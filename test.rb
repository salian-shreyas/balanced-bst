require_relative "lib/tree"

bal_bst = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

bal_bst.pretty_print
puts bal_bst.find(67).data
puts bal_bst.find(8).data
puts bal_bst.find(3).data