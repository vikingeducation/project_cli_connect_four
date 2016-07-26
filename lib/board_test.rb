# board_test.rb
require_relative 'board'

b = Board.new

# Test new board
b.render
puts

# Insert in column 1
b.receive_move?([0, "X"])
b.render
puts
b.receive_move?([0, "O"])
b.render
puts
b.receive_move?([5, "X"])
b.render
puts

