
require "./board.rb"

class Computer

    def initialize
        @board = Board.new
   end

   def move
        [1, 2, 3, 4, 5, 6, 7].sample
   end

end

