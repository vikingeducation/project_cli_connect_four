class Computer

  attr_reader :game_token
  def initialize(game_token)
    @game_token = game_token
  end

  # Returns the column they drop the token into
  def get_move_column
    move = (0..6).to_a.sample
    move
  end
end
