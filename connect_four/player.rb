class Player

  attr_accessor :pick, :piece

  def initialize(piece)
    @piece = piece
  end

  def valid_turn?(value)
    valid_picks = [1,2,3,4,5,6,7]
    return false unless valid_picks.include?(value) && hash[is this value taken?] == false
    true
  end

end



class Human < Player

  def pick
    puts "Please enter your coin (1-7): "
    @pick = get_pick
  end

  def get_pick
    value = nil
    loop do
      value = gets.chomp.upcase
      break if valid_pick?(value)
      puts "That wasn't a valid choice! Enter between 1 and 7."
    end
    value
  end

end



class Computer < Player

  def pick
    @pick = get_pick
  end

  def get_pick
  end

end