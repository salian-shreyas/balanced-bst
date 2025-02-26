require_relative "lib/tree"

bal_bst = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

bal_bst.pretty_print

puts "\nInorder"
puts "From block:"
bal_bst.inorder {|node| print "#{node.data} "}

puts "\nNo block:"
p bal_bst.inorder

puts "\nPreorder"
puts "From block:"
bal_bst.preorder {|node| print "#{node.data} "}

puts "\nNo block:"
p bal_bst.preorder

puts "\nPostorder"
puts "From block:"
bal_bst.postorder {|node| print "#{node.data} "}

puts "\nNo block:"
p bal_bst.postorder
