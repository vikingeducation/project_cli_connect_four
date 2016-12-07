class Game

  def initialize
    @board = Board.new
    @player1 = Human.new(@board, "X", 1)
    @player2 = Human.new(@board, "O", 2)
  end

  def play
    puts puts
    intro
    #2player or 1player
    @board.render
    turn_count = 0
    move = []
    loop do
      turn_count += 1
      if turn_count.odd?
        move = @player1.choose_column
      elsif turn_count.even?
        move = @player2.choose_column
      end
      @board.render
      break if @board.draw? || @board.win?(move)
    end
    game_over
  end

  private

  def intro
    puts "Welcome to Connect Four!"
    puts "Please enter the column number (1-7) such that column 1 would be input as '1'."
  end

  def game_over
    puts puts puts puts
    puts "GAME OVER!"
    puts puts puts puts
  end

end