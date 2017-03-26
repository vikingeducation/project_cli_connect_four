require_relative 'board'
require_relative 'player'
require 'colorize'

class ConnectFour
  def initialize
    @board = Board.new
    game_mode
  end

  def play
    loop do
      @board.render
      @current_player.get_move(@board)
      break if game_over?
      switch_players
      puts "#{@current_player.name}'s turn (#{@current_player.token})"
    end
  end

  private
  def game_mode
    @player1 = Human.new(:r)
    @player1.get_name
    @current_player = @player1
    puts "Hello #{@current_player.name}.  You will be Player One and use the #{@player1.token} token.  Would you like to play against the computer or another person? "
    puts "1) Computer"
    puts "2) Person"
    opponent = gets.chomp.to_i
    if  opponent == 1
      @player2 = Machine.new(:y)
      puts @player2.name
    else
      @player2 = Human.new(:y)
      @player2.get_name
      puts "Welcome #{@player2.name}"
    end
    instructions
  end

  def instructions
    puts "Player One and Player Two will alternate \"dropping\" thier tokens into the gamboard until one player wins by creating a row of four of his/her tokens vertically, horizontally, or diagonally.  If the board is filled with tokens before a row of four is created, the games ends in a draw.  "
  end

  def valid_mode?(input)
    if input == 1 || input == 2
      return true
    else
      puts "Please enter 1 or 2."
    end
  end


  def game_over?
      victory?  || draw?
  end

  def victory?
    if @board.winning_combination?(@current_player.token)
      @board.render
      puts "Congratulations #{@current_player.name}, you win!"
      exit
    end
  end

  def draw?
    if @board.full?
      puts "The game has ended in a tie."
      exit
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

c = ConnectFour.new
c.play
