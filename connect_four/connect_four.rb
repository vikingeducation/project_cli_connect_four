
# Pseudocode
  # Set up the game initially 
  #     Create a game board
  #     Create Players(2)
  # Start the game loop
  #     Render the board
  #     Ask for and validate current player move
  #     Update board 
  #     Check for game over conditions
  #       if the game should end 
  #         Display the proper victory/loss message
  #         break looping
  #       else
  #           Switch to the next player and keep looping

  # Classes:
  #     1. Game (itself)
  #     2. Player 
  #         2.5.  Human < Player
  #         2.6.  Computer < Player
  #     3. Board

#connect_four.rb
class ConnectFour

  def initialize 
    #set up board
    #set up player
    #assign the current player
    @game_board = Board.new
    @player_one =  Human.new("Phillip")
    @player_two = Human.new("Adrian")
  end

  def play
    #Render the board
    #Ask for and validate current player move
    #Update board 
    #Check for game over conditions
    #if the game should end 
    #   Display the proper victory/loss message
    #   break looping
    #else
    #    Switch to the next player and keep looping
  end

  def next_player
    #switches player from current player
  end

  def check_game_over
    #check_victory
    #check_draw
  end

  def check_victory
    #if board says current winner has winning combo
    #    return true
    #else return false
  end

  def check_draw
    #if the board is full return true
  end

  def display_game_over_message
    #if victory
    #    display victory message (current player wins)
    #else
    #    display tie message (no player wins)
  end

end 

game = ConnectFour.new
game.play




