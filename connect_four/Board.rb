class Board

	attr_accessor :board

	def initialize

		@board = default_state

	end



	# setting up the game board
	def default_state

		# hash for the rows
		return { 1 => ["[", "O", "O", "O", "O", "O", "O", "O", "]"					], 2 => ["[", "O", "O", "O", "O", "O", "O", "O", "]"					], 3 => ["[", "O", "O", "O", "O", "O", "O", "O", "]"					], 4 => ["[", "O", "O", "O", "O", "O", "O", "O", "]"					], 5 => ["[", "O", "O", "O", "O", "O", "O", "O", "]"					], 6 => ["[", "O", "O", "O", "O", "O", "O", "O", "]"				  ], 7 => ["-",  1,   2,   3,   4,   5,   6,   7,  "-"				  ]	}

	end


	# the board will only display the current status
	def render

		@board.each do |k, row| print "#{k}--"
			row.each { | col | print col }
			puts ""

		end

	end
	# display messages to the user

	def message( message )

		puts ""
		puts message
		puts ""

	end


	def board_full?

	end


	def column_has_room?( column )

		# checks if the top row is filled
		@board[1][ column ] == "O" ? true : false

	end


	# dropping pieces
	def prepare_to_drop( column, piece )

		# place in the desired column
		if column_has_room?( column )
			# drop the piece
			drop_piece( column, piece )
			true
		else
			false
		end

	end


	def drop_piece( column, piece )

		row = 7
		loop do

			row -= 1
			if @board[ row ][ column ] == "O"
				@board[row][ column ] = piece
				break
			end

		end

	end

end