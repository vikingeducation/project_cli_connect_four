class Human < Player
  attr_reader :name, :color

  def initialize(color)
    @color = color
    @name = get_username
  end

  def get_username
    ask_name_msg
    gets.strip
  end

  def player_input
    current_move = ""
    current_move = gets.strip.to_i until valid_input?(current_move)
    current_move
  end

end
