class Game

  attr_reader :over

  def initialize
    @player_one = nil
    @player_two = nil
    @current_player = nil
    @board = Board.new
  end

  def welcome
    puts "Welcome to a new game of Connect Four!"
  end

  def get_names
    puts "Player One, what is your name?"
    print "> "
    @player_one = Player.new(gets.strip, "red")  
    puts "And your name, Player Two?"
    print "> "
    @player_two = Player.new(gets.strip, "black")
    @current_player = @player_two
  end

  def orient
    puts "Awesome! #{@player_one.name}, you will be playing with red tokens; #{@player_two.name}, you will be playing with black tokens. First to connect four tokens in a row (horizontally, vertically, or diagonally) is a winner!"
  end

  def play
    welcome
    get_names
    orient
    until over
      switch_players
      @board.render
      @current_player.turn(@board)
      @current_player.congratulate if @board.winning_combo?
    end
  end

  def over
    won? || draw?
  end

  def won?
    !@current_player.nil? && @current_player.won
  end

  def draw?
    @board.full? && !won?
  end
  
  protected

  def switch_players
    if @current_player == @player_one
      @current_player = @player_two
    else
      @current_player = @player_one
    end
  end

end