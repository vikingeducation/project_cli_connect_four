class Human < Player

  def initialize(color)
    super
    @name = get_username
  end

  def get_username
    ask_name_msg
    gets.strip
  end

  def player_input
    gets.strip.to_i until valid_input?
  end

end
