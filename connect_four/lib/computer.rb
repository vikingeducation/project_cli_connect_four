# AI computer player 
module Connect_Four
  class Computer < Player
    def initialize(name, piece, board)
      super(name, piece, board)
    end

    def get_coordinates
      loop do
        coords = create_coordinates

        if @board.add_piece(coords, @piece)
          break
        end
      end
    end

    def create_coordinates
      computer_input = [rand(5), rand(6)]
    end
  end
end