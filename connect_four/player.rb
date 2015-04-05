class Player
	attr_reader :piece, :name

	# Initialize player
	def initialize(piece, name)
		@piece = piece
		@name = name
	end

	# See if we have a valid input. Just seeing
	# if this is a number 1..NUM_COLUMNS
	def valid_input?(input)
		(1..NUM_COLUMNS).to_a.include?(input) ? true : false
	end
end

class Human < Player
	# Make a move as a human
	def select_column(board)
		error_message, input = nil, nil
		loop do
			puts error_message || "Enter the column number you'd like to select:"
			input = gets.chomp.to_i
			break if valid_input?(input) && board.playable_column?(input-1)
			# How can I get these to be different error messages??
			error_message = "Invalid Input. Enter column number 1-#{NUM_COLUMNS}"
			redo		
		end
		input
	end
end

class AI < Player
	# Make a move as AI
	def select_column(board)
		winning_move = can_win?(board)
		losing_move = can_lose?(board)
		if winning_move
			winning_move
		elsif losing_move
			losing_move
		else
			rand(1..7)
		end
	end

	# See if there's a winning move
	def can_win?(board)
		# Cycle through all possible column selections
		(1..NUM_COLUMNS).to_a.each do |column|
			# Since we're going to try all the possibilities here
			# I don't want to affect the actual board. Make a deep dup each time.
			board_copy = Marshal.load(Marshal.dump(board))
			board_copy.add_piece(column-1, @piece)
			return column if board_copy.is_victory? 
		end
		nil # Return nil if there's no winning move. Then just choose randomly.
	end

	# See if there's a move we could lose on
	def can_lose?(board)
		# Find out what our opponent's piece is- either X or O
		@piece == "O" ? opponent_piece = "X" : opponent_piece = "O"
		# Cycle through all possible column selections
		(1..NUM_COLUMNS).to_a.each do |column|
			# Since we're going to try all the possibilities here
			# I don't want to affect the actual board. Make a deep dup each time.
			board_copy = Marshal.load(Marshal.dump(board))
			board_copy.add_piece(column-1, opponent_piece)
			return column if board_copy.is_victory? 
		end
		nil # Return nil if there's no winning move. Then just choose randomly.
	end
end
