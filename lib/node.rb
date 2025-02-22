class Node
  include Comparable

  attr_accessor :data, :left_child, :right_child

  def initialize(data = nil)
    @data = data
    @left_child = nil
    @right_child = nil
  end

  def <=>(other)
    @data <=> other.data if other.is_a? Node

    @data <=> other
  end
end
