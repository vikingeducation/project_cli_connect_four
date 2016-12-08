require_relative "human_player.rb"
require_relative "computer_player.rb"
# require_relative "peg_system.rb"
require_relative "peg_system_test.rb"
require_relative "board.rb"

class ConnectFour

  def initialize
    @board = Board.new
  end

  def play
    welcome_display
    against_player_or_computer?
    loop do
      @board.render
      @current_player.get_col_guessed
      break if game_over
      switch_players
      switch_peg_system
    end
    @board.render
  end

  private

  def welcome_display
    puts "
    ____                            _     _____
   / ___|___  _ __  _ __   ___  ___| |_  |  ___|__  _   _ _ __
  | |   / _ \\| '_ \\| '_ \\ / _ \\/ __| __| | |_ / _ \\| | | | '__|
  | |__| (_) | | | | | | |  __/ (__| |_  |  _| (_) | |_| | |
   \\____\\___/|_| |_|_| |_|\\___|\\___|\\__| |_|  \\___/ \\__,_|_|"
   puts
   puts
   puts "ABOUT THE GAME"
   puts "This game is similar to the classic tic-tac-toe game."
   puts "The primary difference is that players must connect four of their pegs in a straight line"
   puts "either horizontally, vertically or diagonally."
   puts
   puts "The player takes turns with the other player or computer to drop pegs into slots within the grid."
   puts "The first one to connect four slots in a line wins."
   puts "The player drops his peg into chosen column. The pegs falls into next available position."
   puts
   puts
  end

  def against_player_or_computer?
    loop do
      @peg_system_one = PegSystem.new("@", @board)
      @peg_system_two = PegSystem.new("O", @board)
      @player_one = HumanPlayer.new("PLAYER ONE", "@" ,@board)
      case ask_for_player_or_computer
      when "C"
        @player_two = ComputerPlayer.new("COMPUTER", "O" ,@board, @peg_system_one, @peg_system_two)
        break
      when "U"
        @player_two = HumanPlayer.new("PLAYER TWO", "O" ,@board)
        break
      else
        puts "You have typed incorrect value. Please try again!"
      end
    end
    @current_player = @player_one
    @current_peg_system = @peg_system_one
  end

  def ask_for_player_or_computer
    puts
    puts "Please choose who would you like to play against with."
    puts "Please type 'U' to play against another User or 'C' to play against Computer."
    gets.strip.upcase
  end

  def is_there_winner?
    if @current_peg_system.winning_connected_four
      puts "Congratulations to #{@current_player.name}!!! You have connected four symbol pegs!"
      true
    else
      false
    end
  end

  def is_there_draw?
    if @board.is_board_full?
      puts "There is no winner this time!"
      true
    else
      false
    end
  end

  def game_over
    is_there_draw? || is_there_winner?
  end

  def switch_players
    @current_player = @current_player == @player_one ? @player_two : @player_one
  end

  def switch_peg_system
    @current_peg_system = @current_peg_system == @peg_system_one ? @peg_system_two : @peg_system_one
  end

end

# s = ConnectFour.new
# s.play
