
require "board"

class Computer

    attr_accessor :board

    def initialize
      @board = Board.new
    end

   def random_move
    [1, 2, 3, 4, 5, 6, 7].sample
   end

   def move
    check_win = @board.winning_move
    #puts check_win.inspect
    return check_win if check_win

    random_move
   end

end
