class Game

  def initialize
    @board = Board.new
    @player1 = Human.new(@board, "X")
    @player2 = Human.new(@board, "O")
  end

  def play
    puts puts
    intro
    #2player or 1player
    @board.render
    turn_count = 0
    move = []
    loop do
      if turn_count.odd?
        move = @player1.choose_column
      elsif turn_count.even?
        move = @player2.choose_column
      end
      @board.render
      break if @board.draw? || @board.win?(move[1], move[2], move[3])
    end
  end

  def intro
    puts "Welcome to Connect Four!"
    puts "INSTRUCTIONS FILL IN LATER"
  end

  def game_over?(column_index, row_index)
    return true if @board.draw? || @board.win?(column_index, row_index)
    false
  end


end