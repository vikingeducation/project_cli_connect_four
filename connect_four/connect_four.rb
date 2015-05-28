require "./board.rb"
require "./player.rb"

class ConnectFour

  def initialize
    @board = Board.new
    @player_one = Player.new("Player One", "X", @board)

    puts "Welcome!  Play against the AI? (y/n)"
    if gets.chomp.downcase == "y"
      @player_two = AIPlayer.new("CPU", "O", @board)
    else
      @player_two = Player.new("Player Two", "O", @board)
    end


    @current_player = @player_one
    @turn_count = 1
  end


  def play
    system("clear")
    @board.render

    loop do
      @current_player.select_column
      next_player if @current_player.piece == @board.last_piece
      @board.win_conditions
      break if @board.winner != nil || @turn_count > 42
    end

    if @board.winner.nil?
      puts "The game is a draw. You should probably play again..."
    else
      puts "Winner: #{@board.winner}!!!"
    end

  end


  def next_player
    system("clear")
    @board.render
    @turn_count += 1
    if @current_player == @player_one
      @current_player = @player_two
    else
      @current_player = @player_one
    end
  end


end




game = ConnectFour.new
game.play