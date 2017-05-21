=begin
  public  - initialize
          - play_game
  private - instructions
          - game_over
          - win?
          - draw?
          - switch_players
  paths - 
=end

class ConnectFour

  require_relative 'player.rb'
  require_relative 'board.rb'

  def initialize
    @board = Board.new
    @player1 = Player.new("x", @board, "Player 1")
    @player2 = AI.new("o", @board, "Computer")
    @current_player = @player1
  end


# start game
  def play_game
    instructions
    loop do
      @board.print_board
      puts "It is #{@current_player.name}'s turn"
      @column = @current_player.column
      @current_player.move_piece(@column, @current_player.game_piece)
      break if game_over(@current_player.game_piece)
      switch_players
    end
  end

  private

  def instructions
    puts "Welcome to Connect Four"
    puts "Make your move by entering what column (1-7) you would like to place your piece"
    puts "Please enter your move in the form 'column#'"
    puts "First player to get four in a row wins"
    puts "Winning combination can be vertical, horizontal or diagonal"
  end


  def game_over(piece)
    win?(piece) || draw?
  end


  def win?(piece)
    if @board.winning_combo?(@column, piece)
      puts "Congrats! #{@current_player.name} wins!!"
      @board.print_board
      true
    else
      false
    end
  end


  def draw?
    if @board.board_full?
      puts "It's a draw... sorry, game_over!"
      true
    else
      false
    end
  end


  def switch_players
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end


end

n = ConnectFour.new
n.play_game
