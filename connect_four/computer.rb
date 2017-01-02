# AI computer player 
module Connect_Four
  class Computer < Player
    def initialize(name, piece, board)
      super(name, piece, board)
    end

    def get_coordinates
      coords = generate_coordinates
      @board.add_piece(coords, @piece)
    end

    # ask_for_coordinates
    def generate_coordinates
      computer_input = [rand(5), rand(6)]
    end

  end
  end
end