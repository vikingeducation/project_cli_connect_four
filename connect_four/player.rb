class Player


  def iniatialize(color)
    @color = color
  end

  def get_move
    player_msg
    player_input
  end

  def valid_input?(input)
    (1..7).to_a.include?(input)
  end
end
