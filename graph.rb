class Graph
  attr_reader :root, :goal

  def initialize(starting_node, end_node)
    @root = Node.new(starting_node)
    @goal = Node.new(end_node)
  end
end
