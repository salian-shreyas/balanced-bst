require_relative "lib/tree"

bal_bst = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

bal_bst.pretty_print
puts "From block:"
bal_bst.level_order {|node| print "#{node.data} "}

puts "\nNo block:"
puts bal_bst.level_order