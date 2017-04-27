 class ConnectFour
	
    def initialize
      #initialize new board
      @board = Board.new
      #initialize player x
      @player_x = Player.new("Player One", :x, @board)
      #initialize player y
      @player_y = Player.new("Player Two", :y, @board)
      #set starting player
      @current_player = @player_x
    end
    
    def play
    		#main game loop
        loop do
        	#cal board render methd
        	@board.render
        	#ask for coordinates from current player
        	@current_player.get_coordinates
        	#checks if game is over
        	break if check_game_over?
            #change current player
            switch_players
         end
     end

    def check_game_over
        # check_victory
        check_victory
        # check_draw
        check_draw
    end

    def check_victory
        # IF board says current player's piece has
        # a winning_combination?
        if @board.winning_combination?(@current_player.piece)
            # display a victory message
            puts "Congratulations #{@current_player.name}, you win"
        end
    end

    def check_draw
        # IF Board says we've filled up
        if @board.full?
            # display a draw message
            puts "draw"
        end
    end


    def switch_players
      if @current_player == @player_x
        	@current_player = @player_y
      else 
         @current_player = @player_x
      end
    end 

#end

# Manages all player-related functionality
class Player

		attr_accessor :name, :piece

    def initialize(name = "name", piece, board)
    	@name = name
    	@piece = piece
    	@board = board
	end
    
    def get_coordinates
      #loop to get coords
      loop do 
        # gets coordinates
        coords = ask_for_coordinates
        #checks if coords are valid format
        if validate_coordinates_format(coords)
          #if piece can be placed on board
          if @board.add_piece(coords, @piece)
            # break the loop
            break
          end
        end
      end
    end

    def ask_for_coordinates
        # Display message asking for coordinates
        puts "#{@name}(#{@piece}), enter your coordinates"
        # pull coordinates from command line
        gets.strip.split(",").map(&:to_i)
    end

    def validate_coordinates_format(coords)
        # UNLESS coordinates are in the proper format
        if coords.is_a?(Array) && coords.length == size
        	 true
        else
            # display error message
            puts "Error"
        end
    end

end

# Maintains game board state
class Board
    # initialize board
    def initialize
        # set up blank data structure
        @board = Array.new(6) { Array.new(7) } 
     end

    def render
    		puts
        # loop through data structure
        @board.each do |row|
        	row.each do |cell|
        	# display an existing marker if any, else blank
        	cell.nil? ? print("-") : print(cell.to_s)
        	end
        	puts
        end
        puts
    end

    def add_piece(coords, piece)
        # IF piece_location_valid?
        if piece_location_valid?(coords)
			# place piece
			@board[coords[0]][coords[1]] = piece
			true
        
        else
          false
        end
    end

    def piece_location_valid?(coords)
        # Is the placement within_valid_coordinates?
        if within_valid_coordinates?(coords)
          # Are the piece coordinates_available?
          coodinates_available?(coords)
    end

    def within_valid_coordinates?
        # UNLESS piece coords are in the acceptible range
        if(0..5).include?(coords[0]) && (0..5).include?(coord[1])
        	true
        else

            # display an error message
            puts "out of bounds"
    end

    def coordinates_available?
        # UNLESS piece coords are not occupied
        if @board[coords[0]][coords[1]].nil?
            true
        else
            # display error message
            puts "error"
        end
    end

    def winning_combination?(piece)
        # is there a winning_diagonal?
        winning_diagonal?(piece) ||
        # or winning_vertical?
        winning_vertical?(piece) || 
        # or winning_horizontal? for that piece?
        winning_vertical?(piece)

    end


    def winning_diagonal?(piece)
        diaganals.any? do |diag|
            diag.all? { |cell| == piece }

        end

    end
    def winning_horizontal?
        # check if specified piece has four across verticals
        horizontals.any? do |horiz|
            horiz.all? { |cell| cell== piece }
        end

    end
    def winning_verticals?
        # check if specified piece has four across horizontals
        verticals.any? do |vert|
            vert.all? { |cell| cell == piece}
    end
  

    def verticals
        # return the vertical pieces
        verticals = []
        4.times do 
            7.times do |i|
                verticals << [@board[0][i],@board[1][i],@board[2][i],@board[3][i]]
            end
        end
    end

    def horizontals
        # return the horizontal pieces
        horizontals = []

        4.times do 
            6.times do |i|
                horizontals << [@board[i][0], @board[i][1], @board[i][2], @board[i][3]]
            end
        end
        horizontals
    end

    def full?
        # does every square contain a piece?
        @board.all? do |row|
            row.none?(&:nil?)
         end
    end
   end
  end
 end
end
