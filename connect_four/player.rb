
# All actions related to the Player

module Connect_Four
  
  class Player
    def move
    end

    def valid_move?
    end

    attr_accessor :name, :piece

      # initialize
      # def initialize(name = "Mystery_Player", piece, board)
      def initialize(piece)
          # Set marker type (e.g. X or O)
          raise "Piece must be a Symbol!" unless piece.is_a?(Symbol)
          # @name = name
          @piece = piece
          # @board = board
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
          puts "#{@name}(#{@piece}), enter your coordinates in the form x,y:"
          # pull coordinates from command line

          # user_input = gets.chomp.strip.split(",").map(&:to_i)
          user_input = gets.chomp.strip.split(",")
          user_input.map(|x| x.to_i)

          # user_input.each do |value|
          #   user_input.to_i
          # end
          
      end

      # validate_coordinates_format
      def validate_coordinates_format(coords)
          if coords.is_a?(Array) && coords.size == 2
              true
          else
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

  def initialize
    @board_arr = board_arr || Array.new(6){Array.new(7)}
  end

  # render
    def render
        puts
        # loop through data structure
        @board_arr.each do |row|
            row.each do |cell|
                # display an existing marker if any, else blank
                cell.nil? ? print("-") : print(cell.to_s)
            end
            puts
        end
        puts
    end
  
    # add_piece
    def add_piece(coords, piece)
        # IF piece_location_valid?
        if piece_location_valid?(coords)
            # place piece
            @board_arr[coords[0]][coords[1]] = piece
            true
        else
            false
        end
    end

    # piece_location_valid?
    def piece_location_valid?(coords)
        # Is the placement within_valid_coordinates?
        if within_valid_coordinates?(coords)
            # Are the piece coordinates_available?
            coordinates_available?(coords)
        end
    end

    # within_valid_coordinates?
    def within_valid_coordinates?(coords)
        # UNLESS piece coords are in the acceptible range
        if (0..5).include?(coords[0]) && (0..6).include?(coords[1])
            true
        else
            puts "Piece coordinates are out of bounds"
        end
    end

    # coordinates_available?
    def coordinates_available?(coords)
        # UNLESS piece coords are not occupied
        if @board_arr[coords[0]][coords[1]].nil?
            true
        else
            # display error message
            puts "There is already a piece there!"
        end
    end

  def winning_combination?(piece)
        # is there a winning_diagonal?
        # or winning_vertical? 
        # or winning_horizontal? for that piece?
        winning_diagonal?(piece)   || 
        winning_horizontal?(piece) || 
        winning_vertical?(piece)
    end

    # winning_diagonal?
    def winning_diagonal?(piece)
        # check if specified piece has a triplet across diagonals
        diagonals.any? do |diag|
            diag.all?{|cell| cell == piece }
        end
    end

    # winning_vertical?
    def winning_vertical?(piece)
        # check if specified piece has a triplet across verticals
        verticals.any? do |vert|
            vert.all?{|cell| cell == piece }
        end
    end

    # winning_horizontal?
    def winning_horizontal?(piece)
        # check if specified piece has a triplet across horizontals
        horizontals.any? do |horz|
            horz.all?{|cell| cell == piece }
        end
    end

     # diagonals
    def diagonals
        # return the diagonal pieces
        [[ @board_arr[0][0],@board_arr[1][1],@board_arr[2][2], @board_arr[1][1] ],[ @board_arr[2][0],@board_arr[1][1],@board_arr[0][2] ]]
    end

    # verticals
    def verticals
        # return the vertical pieces
        verticals = []
        7.times do |i|
            verticals << [@board_arr[0][i],@board_arr[1][i],@board_arr[2][i], board_arr[3][i], board_arr[4][i],board_arr[5][i], board_arr[6][i]]
        end
        verticals
    end

    # horizontals
    def horizontals
        # return the horizontal pieces
        @board_arr
    end

    # full?
    def full?
        # does every square contain a piece?
        @board_arr.all? do |row|
            row.none?(&:nil?)
        end
    end

end


class Game

  attr_accessor :player1, :player2

  def initialize
    @board = Board.new

    # set up the players
    @player_x = Player.new(:r)
    @player_y = Player.new(:y)

    # assign the starting player
    @current_player = @player_x
  end

  def initial_setup
    puts "Do you want 2 players or 1 player to play against the computer?"
    puts "Enter 1 or 2"
    puts "**********************************************"

    answer = gets.chomp.strip
    if(answer == "1")
      @player1 = Player.new(:r)
      @player2 = Computer.new(:y)
    elsif(answer == "2")
      @player1 = Player.new("Player1", :r)
      @player2 = Player.new("Player2", :y)
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
       @board.render
          # ask for coordinates from the current player
        @current_player.get_coordinates

        # check if game is over
        break if check_game_over

        # switch players
        switch_players
    # end
  end

  # check_game_over?
    def check_game_over
        # check for victory
        # check for draw
        check_victory || check_draw
    end

    # check_draw?
    def check_draw
        # If Board says we've filled up 
        if @board.full?
            # display draw message
            puts "You've drawn..."
            true
        else
            false
        end
    end

    # check_victory?
    def check_victory
        # IF Board says current player's piece has
        # a winning_combination?
        if @board.winning_combination?(@current_player.piece)
            # then output a victory message
            puts "Congratulations #{@current_player.name}, you win!"
            true
        else
            false
        end
    end


    # switch_players
    def switch_players
        if @current_player == @player_x
            @current_player = @player_y
        else
            @current_player = @player_x
        end
    end

  def check_vertical
  end

  def check_horizontal
  end

  def check_diagonal
  end




end
