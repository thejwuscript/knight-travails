require_relative 'board'
require 'io/console'

class Graph
  include Board
  attr_accessor :all_nodes, :root, :goal

  def initialize(root, goal)
    @all_nodes = create_nodes
    @root = all_nodes.find { |node| node.data == root }
    @root.distance = 0
    @goal = all_nodes.find { |node| node.data == goal }
  end

  def create_coordinates
    array = []
    0.upto(7) do |i|
      0.upto(7) do |j|
        array << [i, j]
      end
    end
    array
  end

  def create_nodes
    create_coordinates.map { |coord| Node.new(coord) }
  end

  def build_graph(queue = [root])
    while queue.size.positive?
      dequeued = queue.shift
      dequeued.possible_children(all_nodes).each do |node|
        next if node.distance

        node.fill_values(dequeued.distance + 1, dequeued)
        queue << node
      end
    end
  end

  def correct_path_order
    array = []
    temp = goal
    until temp.nil?
      array << temp.data
      temp = temp.predecessor
    end
    array.reverse
  end

  def pause
    puts 'Press any key for next move'
    $stdin.getch
  end

  def show_path
    correct_path_order.each do |coordinate|
      show_board(coordinate)
      return puts 'Finish!' if coordinate == correct_path_order.last

      pause
    end
  end
end
