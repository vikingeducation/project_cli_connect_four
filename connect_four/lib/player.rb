require_relative 'board'
require_relative 'game'

class Player
  attr_reader :color,
              :symbol

  def initialize(color)
    @color = color
    @symbol = self.color == "red" ? 'X' : 'O'
  end

  def input
    puts "Please type in an column number to drop your piece."
    response = gets.chomp.to_i
    (0..6).include?(response) ? response : input
  end

end
