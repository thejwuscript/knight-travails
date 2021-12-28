class Node
  include Comparable
  attr_accessor :data, :distance, :predecessor

  @@all_knight_moves = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, 2], [1, -2], [2, -1], [2, 1]]

  def initialize(data)
    @data = data
    @distance = nil
    @predecessor = nil
  end

  def <=>(other)
    data <=> other.data
  end

  def fill_values(dist, prev)
    self.distance = dist
    self.predecessor = prev
  end

  def possible_children(nodes)
    array = @@all_knight_moves.map do |element|
      [data, element].transpose.map(&:sum)
    end
    array = array.select do |coordinate|
      within_limits?(coordinate)
    end
    coordinate_to_nodes(array, nodes).shuffle
  end

  def within_limits?(array)
    return array if array.all? { |n| n.between?(0, 7) }
  end

  def coordinate_to_nodes(coordinates, nodes)
    coordinates.map do |coordinate|
      nodes.find { |node| node.data == coordinate }
    end
  end
end
