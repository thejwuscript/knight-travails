class Node
  include Comparable

  attr_accessor :data

  def initialize(data)
    @data = data
  end

  def <=>(other)
    data <=> other.data
  end

  def valid_next_coordinates
    temp = []
    array = [
      [-2, -1],
      [-2, 1],
      [-1, -2],
      [-1, 2],
      [1, -2],
      [1, 2],
      [2, -1],
      [2, 1]
    ]
    0.upto(7) do |i|
      candidate = [data, array[i]].transpose.map(&:sum)
      temp << candidate if candidate[0].between?(0, 7) && candidate[1].between?(0, 7)
    end
    temp
  end

  def next_nodes
    valid_next_coordinates.map do |coordinate|
      x, y = coordinate
      array_of_nodes[x][y]
    end
  end

  def array_of_nodes
    array = Array.new(8) { Array.new(8) { ' ' } }
    0.upto(7) do |i|
      0.upto(7) do |j|
        array[i][j] = Node.new([i, j])
      end
    end
    array
  end
end