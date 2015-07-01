# Set up the game initially (ConnectFour)
#     Create a game board (Board)
#     Create a players (Player)
# Start the game loop (ConnectFour)
#     Render the board (Board)
#     Ask for and validate the current player's coordinates (Player)
#     If the game should end (ConnectFour)
#         Display the proper victory / draw message
#         Stop looping
#     Else
#     switch (ConnectFour)



class ConnectFour

  def initialize

    @board = Board.new

    play

  end

  def welcome
    puts "Welcome to Connect Four"
    puts "Choose between 1 and 7 to drop your disk"
  end

  def play
    welcome

    create_players(choose_game_type)

    @current_player = @player1

    loop do
      @board.render

      @current_player.get_move

      break if game_over?
      switch_player
    end

    display_result
    ask_for_play_again
  end

  def choose_game_type
    puts "Would you like to play (1) against the computer 
    or (2) against another player"
    input = gets.chomp.to_i
    until [1,2].include?(input)
      puts "Your input is not valid. Try typing 1 or 2"
      input = gets.chomp.to_i
    end
    input
  end

  def create_players(choice)

    if choice == 1
      @player1 = Human.new("player1", :X, @board)
      @player2 = AI.new("player2", :O, @board)
    else
      @player1 = Human.new("player1", :X, @board)
      @player2 = Human.new("player2", :O, @board)
    end

  end

  def game_over?
    @board.check_victory? || @board.full?
  end

  def switch_player

    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end

  end

  def display_result

    if @board.full?
      puts "Draw!"
    else
      puts "#{@current_player.name} wins!"
    end

  end

  def ask_for_play_again

    puts "Do you want to play again? (y/n)"

    input = gets.chomp.downcase

    until ["y", "n"].include?(input)
      puts "Your input is not valid. Try typing y or n"
      input = gets.chomp.downcase
    end

    play if input == "y"

  end

end



class Board

  def initialize

    @game_board = make_new_board

  end

  def make_board

    Array.new(7) { [] }

  end

  def render

    p @game_board

  end

  def add_piece(column, piece)

    if @game_board[column-1].length < 6
      @game_board[column-1] << piece
    else
      puts "This column is full, you can not add more pieces in it."
    end

  end

end

class Player
  attr_reader :name

  def initialize(name, piece, board)

    @name = name

    @piece = piece

    @board = board

  end




end

class Human < Player

  def get_move

    puts "Which column would you like to drop your disk?"

    loop do

      column = ask_for_column

      if format_valid?(column)

        if @board.add_piece(column, @piece)

          break

        end
      end
    end

  end

  def ask_for_column

    gets.chomp.to_i

  end

  def format_valid?(column)

    if (1..7).include?(column)
      return true
    else
      puts "The number you input must be between 1 and 7."
    end

  end


end


class AI < Player



end

