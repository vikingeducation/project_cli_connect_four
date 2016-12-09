class Game

  def initialize
    @board = Board.new
  end

  def play
    intro
    mode = how_many_players
    activate(mode)
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
      break if @board.win?(move) || @board.draw? 
    end
    game_over
  end

  def how_many_players
    puts
    puts "Would you like to play the game in 1-player or 2-player mode?"
    puts "Enter 'a' for 1-player mode or 'b' for 2-player mode."
    mode = gets.chomp.downcase
    until %w(a b).include?(mode)
      puts "Sorry, please enter 'a' for 1-player mode or 'b' for 2-player mode."
      mode = gets.chomp.downcase
    end
    mode
  end

  def activate(mode)
    if mode == "a"
      @player1 = Human.new(@board, "X", 1)
      @player2 = AI.new(@board, "O", 2)
    elsif mode == "b"
      @player1 = Human.new(@board, "X", 1)
      @player2 = Human.new(@board, "O", 2)
    end
  end


  def intro
    puts puts puts
    puts "Welcome to Connect Four!"
    puts
    puts "Instructions:"
    puts "When it's your turn, please enter the number (1-7) of the column you'd like to drop your piece into, such that column 1 would be input as '1'."
  end

  def game_over
    puts puts puts puts
    puts "GAME OVER!"
    puts puts puts puts
  end

end