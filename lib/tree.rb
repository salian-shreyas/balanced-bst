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

  def find(value, node = @root)
    return node if node.nil? || node == value

    return find(value, node.left) if node > value
    return find(value, node.right) if node < value
  end

  def level_order(queue = Queue.new([@root]), array = [], &block)
    return (block_given? ? nil : array) if queue.empty?

    node = queue.deq
    queue.enq node.left unless node.left.nil?
    queue.enq node.right unless node.right.nil?

    block_given? ? block.call(node) : array.push(node.data)

    level_order(queue, array, &block)
  end

  def inorder(node = @root, array = [], &block)
    return (block_given? ? nil : array) if node.nil?

    array = inorder(node.left, array, &block)
    block_given? ? block.call(node) : array.push(node.data)
    array =  inorder(node.right, array, &block)

    array
  end

  def preorder(node = @root, array = [], &block)
    return (block_given? ? nil : array) if node.nil?

    block_given? ? block.call(node) : array.push(node.data)
    array = preorder(node.left, array, &block)
    array =  preorder(node.right, array, &block)

    array
  end

  def postorder(node = @root, array = [], &block)
    return array if node.nil?

    array = postorder(node.left, array, &block)
    array =  postorder(node.right, array, &block)
    block_given? ? block.call(node) : array.push(node.data)

    array
  end

  def height(node = @root)
    return 0 if node.nil? || (node.left.nil? && node.right.nil?)

    [height(node.left), height(node.right)].max + 1
  end

  def depth(key, node = @root, counter = 0)
    return if node.nil?
    return counter if node == key

    depth(key, (node > key) ? node.left : node.right, counter + 1)
  end
  
  def balanced?(node = @root)
    return true if node.nil? 

    return false if height(node.left) != height(node.right)

    balanced?(node.left) && balanced?(node.right)
  end

  def balance
    @root = build_tree inorder
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