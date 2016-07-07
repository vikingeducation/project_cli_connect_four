class Player

  VALID_PICKS = (1..7).to_a

  attr_accessor :pick, :piece

  def initialize(piece)
    @piece = piece
  end

  def valid_turn?(value)
    VALID_PICKS.include?(value)
  end

end



class Human < Player

  def pick
    ask_input
    @pick = get_pick
  end

  def ask_input
    puts "Please enter your coin (1-7): "
  end

  def get_pick
    value = gets.chomp.to_i
    if valid_turn?(value)
      value
    else
      puts "That was not a correct choice. Please try again."
      get_pick
    end
  end

end



class Computer < Player

  def pick
    @pick = get_pick
  end

  def get_pick
  end

end