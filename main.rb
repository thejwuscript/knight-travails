require_relative 'graph'
require_relative 'node'
require_relative 'board'

def knight_moves(start, finish)
  graph = Graph.new(start, finish)
  graph.build_graph
  puts "You made it in #{graph.goal.distance} moves! Here's your path:"
  graph.show_path
end

system('clear')
puts 'Welcome to Knights Travails. Choose your following adventure:'
puts '  1)  [3,3] ➡ [4,3]'
puts '  2)  [2,2] ➡ [6,5]'
puts '  3)  [7,7] ➡ [0,0]'
puts '  4)  None of the above. I want to choose my own adventure!'
puts ''
print 'Enter a number: '

loop do
  case num = gets.chomp.to_i
  when 1
    puts ''
    knight_moves([3, 3], [4, 3])
  when 2
    puts ''
    knight_moves([2, 2], [6, 5])
  when 3
    puts ''
    knight_moves([7, 7], [0, 0])
  when 4
    puts 'Under constuction. Please try again.'
  else
    puts 'Invalid entry, try again.'
  end
  break if num.between?(1, 3)
end
