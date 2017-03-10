
class Player

  attr_reader :piece, :column

  def initialize(piece)
    @piece = piece
    @column = nil
  end

  def move
    puts "pick a number between 1 and 7"
    @column = gets.chomp.to_i
    until valid?
      puts "Pick a number between 1 and 7"
      @column = gets.chomp.to_i
    end
    @column -= 1
  end

  def valid?
    @column.to_i >= 1 && @column.to_i <= 7
  end

end
    