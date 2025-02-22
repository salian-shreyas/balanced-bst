require_relative "./node"

class Tree
  def initialize(array)
    @root = build_tree array
  end

  def insert(value, node = @root)
    return Node.new(value) if node.nil?

    if node.data > value
      node.left_child = insert(value, node.left_child)
    else
      node.right_child = insert(value, node.right_child)
    end

    node
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
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