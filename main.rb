require_relative 'board.rb'
require_relative 'pieces.rb'

class Node
  attr_accessor :data, :next_nodes

  def initialize(data)
    @data = data # a coordinate
    @next_nodes = valid_next_coordinates # will have 8 nodes nested
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

  def valid_next_nodes; end
end

class Graph

  attr_accessor :coordinate_list, :root

  def initialize(starting_point)
    @coordinate_list = array_of_coordinates
    @root = build_graph(starting_point)
  end

  def build_graph(coordinate)
    node = Node.new(coordinate)
    puts "The starting point is #{node.data}"
    puts "Children are #{node.next_nodes}"
    

  end

  def array_of_coordinates
    array = Array.new(8) { Array.new(8) { ' ' } }
    0.upto(7) do |i|
      0.upto(7) do |j|
        array[i][j] = i, j
      end
    end
    array.flatten(1)
  end
end

graph = Graph.new([3,3])




def knight_moves(value1, _value2)
  graph = Graph.new(value1)
  # x, y = value1
  # a, b = value2
  # p array_of_values[x][y]
  # p array_of_values[a][b]
end

#knight_moves([3, 3], [4, 3])
#=> You made it in 3 moves!  Here's your path:
#  [3,3]
#  [4,5]
#  [2,4]
#  [4,3]
