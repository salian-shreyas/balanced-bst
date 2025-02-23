require_relative "./node"

class Tree
  def initialize(array)
    @root = build_tree array
  end

  def insert(value, node = @root)
    return Node.new(value) if node.nil?

    if node.data > value
      node.left = insert(value, node.left)
    else
      node.right = insert(value, node.right)
    end

    node
  end

  def delete(value, node = @root)
    return if node.nil?

    if node < value
      node.right = delete(value, node.right)
    elsif node > value
      node.left = delete(value, node.left) 
    else
      if node.left.nil?
        node = node.right
      elsif node.right.nil?
        node = node.left
      else
        succ = successor(node.right)
        node.data = succ.data
        node.right = delete(succ.data, node.right)
      end
    end

    node
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
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

    node.left = build_tree_rec(array, start, mid - 1) 
    node.right = build_tree_rec(array, mid + 1, last)

    return node
  end

  def successor(node)
    return node if node.left.nil?

    successor(node.left)
  end
end