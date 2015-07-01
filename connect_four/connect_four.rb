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

    current_player = @player1

    loop do
      @board.render

      current_player.get_move

      break if game_over?
      current_player = switch_player
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
      @player1 = Human.new(:X, @board)
      @player2 = AI.new(:O, @board)
    else
      @player1 = Human.new(:X, @board)
      @player2 = Human.new(:O, @board)
    end

  end

end



class Board

  def initialize

    @game_board = make_new_board

  end

  def make_board

    Array.new(6) { Array.new(7)}

  end

  def render

    p @game_board

  end

end

class Player

  def initialize(piece, board)

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


end


class AI < Player



end

