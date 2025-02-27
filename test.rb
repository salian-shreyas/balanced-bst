require_relative "lib/tree"

bal_bst = Tree.new(Array.new(15) {rand(1..100)})

puts bal_bst.balanced?

p bal_bst.preorder
p bal_bst.postorder
p bal_bst.inorder

bal_bst.insert(110)
bal_bst.insert(240)
bal_bst.insert(101)
bal_bst.insert(640)

puts bal_bst.balanced?

bal_bst.balance

puts bal_bst.balanced?

p bal_bst.preorder
p bal_bst.postorder
p bal_bst.inorder

bal_bst.pretty_print