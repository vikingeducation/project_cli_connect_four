
require "./board.rb"

class Computer

    attr_accessor :board

    def initialize
      @board = Board.new
    end

   def move
     @board.winning_move || [1, 2, 3, 4, 5, 6, 7].sample
   end

end
