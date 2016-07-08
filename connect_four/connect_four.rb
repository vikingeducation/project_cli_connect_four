
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
    @game_board = Board.new
    @player_one =  Human.new("Phillip", :x)
    @player_two = Human.new("Adrian", :o)
    @current_player = @player_one
  end

  def play
    #Render the board
    @game_board.render

    loop
      #Ask for and validate current player move
      column_num = 0
      loop
        column_num = @current_player.take_turn
        if @game_board.column_full?(column_num)
          puts "That column is already full. Please enter a new one."
        else
          break
        end
      end

      #Update board
      @game_board.add_piece(column_num, @current_player.piece)
      @game_board.render
      
      #Check for game over conditions
      if game_over?
        display_game_over_message
        break
      else
        next_player
      end
    end

    
    puts "Thanks for player! Goodbye!"

  end

  def next_player
    @current_player = @player_two if @current_player == @player_one
    @current_player = @player_one
  end

  def game_over?
    check_victory || check_draw
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




