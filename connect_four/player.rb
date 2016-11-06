
class Player
  attr_reader :piece

  def initialize(piece: nil)
    @piece = piece
  end

  def get_move
    raise NotImplementedError
  end

end

class HumanPlayer < Player

  def get_move
    gets.strip
  end

  def get_input
    get_move
  end
end

class ComputerPlayer < Player

  def get_move
    (1..7).to_a.sample
  end
end
