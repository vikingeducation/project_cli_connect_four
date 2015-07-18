class ConnectFour

	def initialize(players)
		@board = Board.new

		@player_red    = Player.new("Big Red", "R", @board)
		@player_yellow = Player.new("Mellow Yellow", "Y", @board) if players == 2
		@player_yellow = AI.new("Yellow Destroyer", "Y", @board)

		@current_player = @player_red
	end

  def play

  	loop do 
  		@board.render

  		@current_player.get_move

  		break if check_game_over

  		switch_players
  	end
  end


  def check_game_over
  	check_victory  || check_draw
  end

  def check_victory

  	if @board.winning_combination?(@current_player.piece)

  		@board.render
  		puts "Congratulations #{@current_player.name}, you win!"  		
  		true
  	else
  		false
  	end
  end

  def check_draw
  	if @board.full?

  		@board.render
  		puts "Bummer, it's a draw."
  		true
  	else
  		false
  	end
  end

  def switch_players
  	if @current_player == @player_red
  		@current_player = @player_yellow
  	else
  		@current_player = @player_red
  	end
  end

end




# ------------ The Board ------------------------------------------------------


class Board

  def initialize
  	@board = Array.new(7) { Array.new }
  end

  def render
  	puts "\e[H\e[2J"
		puts "\t+++++++ Connect Four ++++++++"
		puts "\n\n\n"
		
		5.downto(0) do |row|
		  print "\t"
		  (0..6).each do |col|
		    if @board[col][row]
		      print "| #{@board[col][row]} "
		    else
		      print "|   "
		    end
		  end
		  
		  puts "|\n"
		  puts "\t" + "-" * 29
		end
		print "\t  " 
		(1..7).each {|i| print i.to_s.ljust(4)}

		puts " "
		puts " "
	end

	def add_piece(move, piece)
		if piece_location_valid?(move)
			@board[move - 1] << piece
			true
		else
			false
		end
	end

	def piece_location_valid?(move)
		if within_valid_column?(move)
			space_available?(move)
		end
	end

  def within_valid_column?(move)
  	if (1..7).include?(move)
  		true
  	else
  		puts "You did not pick a valid column."
  	end
  end

	def space_available?(move)
		if @board[(move - 1)].size < 6
			true
		else
			puts "This column is full."
			false
		end
	end

	def winning_combination?(piece)
    winning_diagonal?(piece)    ||  
    winning_horizontal?(piece)  ||
    winning_vertical?(piece)
  end

  def winning_diagonal?(piece)
    diagonals.any? do |diag|
		  if diag.size > 3
			  diag.join('').include?((piece * piece_count))
			end
		end
  end

  def winning_vertical?(piece)
      verticals.any? do |vert|
        vert.join('').include?(piece * 4)
      end
  end

  def winning_horizontal?(piece)
      horizontals.any? do |horz|
      	hor = horz.map do |x|
      		x.nil? ? x = 'X' : x
      	end
      	hor.join('').include?(piece * 4)
      end
  end

  def diagonals
    [@board, @board.map(&:reverse)].inject([]) do |all_diags, matrix|
      ((-matrix.count + 1)..matrix.first.count).each do |offet_index|
        diagonal = []
        (matrix.count).times do |row_index|
          col_index = offet_index + row_index
          diagonal << matrix[row_index][col_index] if col_index >= 0
        end
        all_diags << diagonal.compact if diagonal.compact.count > 1
      end
      all_diags
    end
  end

  def verticals
      @board
  end

  def horizontals
    horizontals = []
    6.times do |i|
      horizontals << [@board[0][i],@board[1][i],@board[2][i],@board[3][i],@board[4][i],@board[5][i],@board[6][i]]
    end
    p horizontals 

  end

  def full?
      @board.all? do |row|
          row.size == 6
      end
  end

end



# ------------ Player ---------------------------------------------------------


class Player
  attr_accessor :name, :piece

  def initialize(name="Mr. E", piece, board)
  	@name = name
  	@piece = piece
  	@board = board
  end

  def get_move
  	loop do
  		move = ask_for_move

  		if validate_move_format(move)
  			if @board.add_piece(move, piece)
  				break
  			end
  		end
  	end
  end

  def ask_for_move
  	puts "#{@name}, which column would you like to drop your piece in?"
    gets.strip.to_i
  end

  def validate_move_format(move)
  	if move.is_a?(Integer) && move.to_s.length == 1
  		true
  	else
  		puts "You did not enter your move correctly."
  	end
  end


end




# ------------ AI -------------------------------------------------------------


class AI 

	attr_accessor :name, :piece

  def initialize(name, piece, board)
  	@name = name
  	@piece = piece
  	@board = board
  end

  def get_move
    move = rand(1..7)
    @board.add_piece(move, piece)  
  end

end

puts "Would you like to play with 1 or 2 players?"
players = gets.strip.to_i

game = ConnectFour.new(players)

game.play

# STOP HERE
