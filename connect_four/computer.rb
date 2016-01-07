
require "./board.rb"

class Computer

    def initialize
        @board = Board.new
   end

   def random_move
        [1, 2, 3, 4, 5, 6, 7].sample
   end

   def move
        return @board.winning_move if @board.winning_move
        random_move
   end



end

