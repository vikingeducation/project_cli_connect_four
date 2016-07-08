
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

require_relative "board" 
require_relative "player" 
require_relative "human" 

#connect_four.rb
class ConnectFour

  def initialize 
    @game_board = Board.new
    @player_one =  Human.new("Phillip", :x)
    @player_two = Human.new("Adrian", :o)
    @current_player = @player_one
  end

  def play
    puts "\n#{@player_one.name} is current player represented by piece: #{@current_player.piece} "
    puts "\n#{@player_two.name} is current player represented by piece: #{@current_player.piece} "
    #Render the board
    @game_board.render

    loop do
      #Ask for and validate current player move
      column_num = 0
      loop do
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
        puts "next player ahoy"
        next_player
      end
    end

    puts "Thanks for playing! Goodbye!"
  end

  def next_player
    # puts @current_player.info
    # puts @player_one.info
    # puts @player_two.info

    # if @current_player.equals?(@player_one)
    #   @current_player.to(@player_two)
    # else
    #   @current_player.to(@player_one)
    # end
    if @current_player == @player_one
      @current_player = @player_two
    else
      @current_player = @player_one
    end

    puts "#{@current_player.name} is now the current player"
  end

  def game_over?
    check_victory || check_draw
  end

  def check_victory
    @game_board.winning_combination?
  end

  def check_draw
    @game_board.full?
  end

  def display_game_over_message
    puts "#{@current_player.name} wins the game, congratulations!" if check_victory 
    puts "It's a tie, you're all losers!!" if check_draw
  end

end 

game = ConnectFour.new
game.play




