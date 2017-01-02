# All actions related to the Player
module Connect_Four

  class Player
    attr_accessor :name, :piece
    
    def initialize(name, piece, board)
      raise "Piece must be a Symbol!" unless piece.is_a?(Symbol)
      @name = name
      @piece = piece
      @board = board
    end
  end
end