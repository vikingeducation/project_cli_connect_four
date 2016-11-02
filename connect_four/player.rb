
class Player
  attr_reader :piece

  def initialize(piece:)
    @piece = :piece
  end

  def get_move
    raise NotImplementedError
  end

end

class HumanPlayer < Player

  def get_move

  end
end

class ComputerPlayer < Player

  def get_move

  end
end
