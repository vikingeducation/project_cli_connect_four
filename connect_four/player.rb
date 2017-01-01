
# All actions related to the Player

module Connect_Four
  class Player
    def move
    end

    def valid_move?
    end

    attr_accessor :name, :piece

      # initialize
      def initialize(name = "Mystery_Player", piece, board)
          # Set marker type (e.g. X or O)
          raise "Piece must be a Symbol!" unless piece.is_a?(Symbol)
          @name = name
          @piece = piece
          @board = board
      end

      # get_coordinates
      def get_coordinates
          # loop infinitely
          loop do
              # ask_for_coordinates
              coords = ask_for_coordinates

              # IF validate_coordinates_format is true
              if validate_coordinates_format(coords)
                  # IF piece can be placed on Board
                  if @board.add_piece(coords, @piece)
                      # break the loop
                      break
                  end
              end
          end
      end


      # ask_for_coordinates
      def ask_for_coordinates
          # Display message asking for coordinates
          puts "#{@name}(#{@piece}), enter your coordinates in the form x,y:"
          # pull coordinates from command line
          gets.strip.split(",").map(&:to_i)
      end

      # validate_coordinates_format
      def validate_coordinates_format(coords)
          # UNLESS coordinates are in the proper format
          if coords.is_a?(Array) && coords.size == 2
              true
          else
              # display error message
              # Note that returning `nil` acts falsy!
              puts "Your coordinates are in the improper format!"
          end
      end

end

# AI computer player 
module Connect_Four
  class Computer < Player
  end

# Layout of the board
class Board

  
  attr_accessor :board

  def render
  end

  

  def ask_for_move
  end

  def position_occupied?
  end

end


class Game

  attr_accessor :player1, :player2

  def initialize
    @board = Board.new

    # set up the players
    @player_x = Player.new
    @player_y = Player.new

    # assign the starting player
    @current_player = @player_x
  end

  def initial_setup
    puts "Do you want 2 players or 1 player to play against the computer?"
    puts "Enter 1 or 2"
    puts "**********************************************"

    answer = gets.chomp.strip
    if(answer == "1")
      @player1 = Player.new
      @player2 = Computer.new
    elsif(answer == "2")
      @codemaker = Player.new
      @codebreaker = Player.new
    else 
      puts "Please ensure you enter your input correctly"
      initial_setup
    end
  end

  def play
    puts "Welcome to Connect 4"
    puts "**********************************************"

    initial_setup

    # while the user has not quit, loop the game
    
    # end

  end

  def check_vertical
  end

  def check_horizontal
  end

  def check_diagonal
  end


  def game_won?
  end

  def switch_players
  end



end
