class Graph
  attr_reader :root, :goal, :depth

  def initialize(starting_node, end_node)
    @root = Node.new(starting_node)
    @goal = Node.new(end_node)
    @depth = how_many_moves
  end

  def how_many_moves(node = root, counter = 0, queue1 = [], queue2 = [])
    if node == goal
      counter
    elsif queue1.empty?
      if queue2.any?
        queue1 = queue2
        queue2 = []
        node.next_nodes.each { |child| queue1 << child }
        queue2 = queue2.uniq { |elem| elem.data }
        counter += 1
        dequeued_node = queue1.shift
        how_many_moves(dequeued_node, counter, queue1, queue2)
      else
        node.next_nodes.each { |child| queue1 << child }
        queue1 = queue1.uniq { |elem| elem.data }
        counter += 1
        dequeued_node = queue1.shift
        how_many_moves(dequeued_node, counter, queue1, queue2)
      end
    else
      node.next_nodes.each { |child| queue2 << child }
      queue2 = queue2.uniq { |elem| elem.data }
      dequeued_node = queue1.shift
      how_many_moves(dequeued_node, counter, queue1, queue2)
    end
  end
end
