class Player
  include Display

  def get_move
    player_msg(name)
    player_input
  end

  def valid_input?(input)
    (1..7).to_a.include?(input)
  end
end
