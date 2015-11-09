class Player

  def initialize(board)
    @board = board
    @name = get_name
  end

  private

  def get_name
    puts "Welcome, new player!  What is your name?"
    gets.chomp
  end

end
