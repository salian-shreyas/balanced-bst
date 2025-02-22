require_relative "./node"
class Tree
  def initialize(array)
    @root = build_tree array
  end
 
  private

  def build_tree(array) 
    array.sort!.uniq!

    build_tree_rec(array, 0, array.length - 1)
  end

  def build_tree_rec(array, start, last)
    return nil if start > last

    mid = (start + last) / 2
    node = Node.new(array[mid])

    node.left_child = build_tree_rec(array, start, mid - 1) 
    node.right_child = build_tree_rec(array, mid + 1, last)

    return node
  end
end