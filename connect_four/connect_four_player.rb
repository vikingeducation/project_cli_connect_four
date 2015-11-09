class Player
  attr_reader :name, :symbol

  def initialize(board, symbol)
    @board = board
    @symbol = symbol
    @name = get_name
    puts "Welcome, #{@name.capitalize}. Your game piece is '#{symbol}'."
  end

  private

  def get_name
    puts "Welcome, new player!  What is your name?"
    gets.chomp
  end

end
