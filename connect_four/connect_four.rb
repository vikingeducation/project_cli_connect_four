class Game

  def initialize(num_of_players)
    @board = Board.new
    if num_of_players == 1
      @player1 = Human.new("(-B-)")
      @player2 = Computer.new("(-R-)")
    elsif num_of_players == 2
      @player1 = Human.new("(-B-)")
      @player2 = Human.new("(-R-)")
    end
    @current_player = @player1
  end

  def game_loop
    welcome
    until game_over?
      turn
      assign_player
    end
    final_message
  end

  def welcome
    puts "Welcome to Connect4."
  end

  def turn
    @board.render
    @current_player.pick
    @board.enter_pick(@current_player.pick, @current_player.piece)
  end

  def assign_player
    if @current_player == @player1
      @current_player = @player2
    end
    @current_player = @player1
  end

  def game_over?
    if win? || tie?
      true
    else
      false
    end
  end

  def final_message
    if win?
      "Some player won" #determine who wins
    elsif tie?
      "The game is a tie."
    end
  end

  def win?
  end

  def tie?
  end


end