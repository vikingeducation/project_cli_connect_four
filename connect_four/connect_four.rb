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

  end

  def welcome
    puts "Welcome to Connect Four"
    puts "Choose between 1 and 7 to drop your disk"
  end

  def play
    welcome

    choose_game_type

    create_players

    loop do 
      @board.render
      @player1.get_move
      break if game_over?
      switch_player
    end

    display_result
    ask_for_play_again
  end

end



class Board

  def initialize

  end

end

