require_relative 'board'
require_relative 'human'
require_relative 'machine'

class ConnectFour
  attr_accessor :board, :player1, :current_player, :player2
 def initialize
    @board = Board.new
    puts "What is your name?"
    player1_name = "ANN"
    player1_token = "X"
    @player1 = Human.new(player1_name, player1_token, @board)
    @current_player = @player1
    puts "Hello #{@current_player.name}.  You will be Player One and use the #{@player1.token} token.  Would you like to play against the computer or another person? "
    puts "1) Computer"
    puts "2) Person"
    player2_token = "M"
    gets = 1
    if  gets == 1
      @player2 = Machine.new(player2_token, @board)
      puts @player2.name
    else
      puts "What is the second person's name?"
      player2_name = "Michael"
      @player2 = Human.new(player2_name, player2_token, @board)
      puts "Welcome #{@player2.name}"
    end
    instructions
 end

  def instructions
    puts "Player One and Player Two will alternate \"dropping\" thier tokens into the gamboard until one player wins by creating a row of four of his/her tokens vertically, horizontally, or diagonally.  If the board is filled with tokens before a row of four is created, the games ends in a draw.  "
  end

  def play
  @board.render
    loop do
      @current_player.get_drop_column
      break if check_game_over
      @board.render
      switch_players
      puts "#{@current_player.name}'s turn (#{@current_player.token})"
    end
  end

  def check_game_over
      check_victory  || check_draw
  end

  def check_victory
      if @board.winning_combination?
          @board.render
          puts "Congratulations #{@current_player.name}, you win!"
          true
      else
          false
      end
  end

  def check_draw
      if @board.full?
          puts "The game has ended in a tie."
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
      board.token = @current_player.token
  end
end

c = ConnectFour.new
c.play
