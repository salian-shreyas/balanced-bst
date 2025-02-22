class Node
  include Comparable

  attr_writer :left_child, :right_child

  def initialize(data = nil)
    @data = data
    @left_child = nil
    @right_child = nil
  end

  protected

  attr_reader :data
end
