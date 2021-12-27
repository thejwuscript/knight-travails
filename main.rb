require_relative 'board.rb'
require_relative 'graph.rb'
require_relative 'node.rb'

def knight_moves(value1, value2)
  graph = Graph.new(value1, value2)
  puts "You made it in #{graph.depth} moves! Here's your path:"
  graph.find_path.each { |node| p node.data }
end

knight_moves([0, 0], [5, 3])
