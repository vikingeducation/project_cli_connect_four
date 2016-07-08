require_relative "connect_four"

require_relative "board"

#### testing
class Board
  attr_reader :game_board
  
  def create_board_structure
    7.times do |count|
      @game_board[count + 1] = Array.new(6, [:clear, :x, :o].sample)
    end
  end
end

b=Board.new
b.render

diagonals_down

puts
puts b.winning_combination?
print b.four_in_a_row?(b.diagonals), "\n"
print  b.four_in_a_row?(b.verticals), "\n"
print b.four_in_a_row?(b.horizontals), "\n"