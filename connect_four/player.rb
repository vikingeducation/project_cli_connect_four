# Player
# - move (class or method?)
# - drop (Piece, column)
# play passes color position of piece to board

class Player
  attr_reader :color, :symbol

  def initialize(attrs = {})
    @color = attrs[:color]
    @symbol = self.color == "red" ? 'X' : 'O'
  end

  def input
    puts "Please type in an column number to drop your piece."
    response = gets.chomp.to_i
    response.match(/\A[0-6]\Z/) ? response : input
  end

  def symbol
    @symbol
  end

end
