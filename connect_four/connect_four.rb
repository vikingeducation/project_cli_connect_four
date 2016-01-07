require './computer.rb'
require './board.rb'
require './disk.rb'

require "highline"
CLI = HighLine.new

class ConnectFour
  def initialize
    @board = Board.new
    @current_player = true
    #true = player 1 turn, false = player 2 turn
    @opponent = "2"
  end

  def print_intro

      input = CLI.ask "Welcome to Connect Four!\nDo you wish to play the computer or another human ( 1 = computer, 2  = human)?\n"
      until input == "1" || input == "2"
            input = CLI.ask "Invalid choice.  Do you wish to play the computer or another human ( 1 = computer, 2  = human)?\n"
      end
    @opponent = Computer.new if input == "1"
    puts
  end

  def play
    print_intro

    loop do
      #prints board
      @board.render
      #prints current player turn
      puts @current_player  ?  "Player 1's  turn" : "Player 2's turn"
      #obtain valid user move

      if @current_player || @opponent == "2" 
          player_move = get_user_input
          until @board.valid_move? ( player_move )
              player_move = get_user_input
          end
      else
          player_move = @opponent.move
          until @board.valid_move? ( player_move )
              player_move = @opponent.move
          end
       end

      #process move and update board
      if @current_player
        @board.place_disk( Disk.make_player_1_disk,  player_move  - 1)
      else
        @board.place_disk( Disk.make_player_2_disk, player_move  - 1 )
      end
      #check end game conditions (winner or full board)
      break if end_conditions?
      #swap turns
      @current_player = !@current_player
      #clear screen
      system("clear")
    end
  end

  #checks all end game conditions
  def end_conditions?
    #checks winner
    if @board.win_conditions?
      if @current_player
          puts "Congratulations! Player 1 wins!!"
      else
          puts "Congratulations! Player 2 wins!!"
      end
      @board.render
      return true
    end
    #return true if game over
    if @board.grid_full?
      puts "It's a draw! GAME OVER."
      @board.render
      return true
    end
    false
  end

  #obtain valid user move
  def get_user_input
    loop do
        input = CLI.ask "Please enter a valid column from 1 to 7:"
        case input
        when /^[1-7]$/
            return input.to_i
        else
            puts "INVALID INPUT!"
            puts
            next
        end
    end
  end
end

game = ConnectFour.new
game.play
