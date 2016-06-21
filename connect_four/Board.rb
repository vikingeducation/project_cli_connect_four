class Board

	attr_accessor :board

	def initialize

		@board = default_state

	end



	# setting up the game board
	def default_state

		# change to array
		# hash for the board
		return [
						 "[", "O", "O", "O", "O", "O", "O", "O", "]",
	 				   "[", "O", "O", "O", "O", "O", "O", "O", "]",
	 				   "[", "O", "O", "O", "O", "O", "O", "O", "]",
	 				   "[", "O", "O", "O", "O", "O", "O", "O", "]",
	 				   "[", "O", "O", "O", "O", "O", "O", "O", "]",
	 				   "[", "O", "O", "O", "O", "O", "O", "O", "]",
	 				   "-",  1,   2,   3,   4,   5,   6,   7,  "-"
	 				 ]
	end


	# the board will only display the current status
	def render

		puts ""
		@board.each_with_index do | row, index |
			if index % 9 == 0 && index != 0
				puts ""
				print row
			else
				print row
			end
		end

	end
	# display messages to the user

	def message( message )

		puts ""
		puts message
		puts ""

	end



	# generate a string to check rows
	def board_as_string_row

		return @board.join

	end




	# generate a string to check columns
	def board_as_string_col

		board_col_array = []

		@board.each_with_index do | e, i |
			# means to separate the columns in the string
			board_col_array << "."
			# grab column 1 through 7
			if (1..7) === i
				until i > 52
					board_col_array << @board[i]
					i += 9
				end
			end
		end

		return board_col_array.join


	end


	def board_as_string_diagonal

		board_diag_array = []

		@board.each_with_index do | e, i |


				if (1..3) === i || i == 10 || i == 19
			 		board_diag_array << process_diagonal( i, "right" )

				elsif (5..7) === i || i == 16 || i == 25

	  		  board_diag_array << process_diagonal( i, "left" )

	  		elsif i == 4

	  			board_diag_array << process_diagonal( i, "right" )
	  			board_diag_array << process_diagonal( i, "left" )

	  		end
				board_diag_array << "."
	  end


	  return board_diag_array.join



	end




	def process_diagonal( index, direction )

		arr = []
		until @board[ index ] == nil || @board[ index ] == "]" || @board[ index ] == "[" || @board[ index ] == "-" || board[ index ].is_a?( Fixnum )

			arr << @board[ index ]
			direction == "right" ? index += 10 : index += 8

		end

		return arr.join

	end





	def victory?( piece )

		# find if 4 colors are in a row
		return true if four_in_a_row( piece )

		return true if four_in_a_column( piece )

		return true if four_in_a_diagonal( piece )
		# call each method (row/diagonal)

	end




	def player_pieces_as_string( piece )

		return piece.to_s * 4

	end



	def four_in_a_row( piece )
		# sets starting index to middle of top row
		row_of_four = player_pieces_as_string( piece )

		return true if board_as_string_row.include?( row_of_four )


	end





	def four_in_a_column( piece )

		row_of_four = player_pieces_as_string( piece )

		return true if board_as_string_col.include?( row_of_four )

	end





	def four_in_a_diagonal( piece )

		row_of_four = player_pieces_as_string( piece )

	  return true if board_as_string_diagonal.include?( row_of_four )

	end




	def get_column_string( index )

		# starts the top of the column
		board_index = index - 18
		arr = []

		6.times do

			arr << @board[ board_index ]

			board_index += 9

		end

		return arr.join

	end




	def draw?

		# determine if all positions are filled
		@board.any? { | x | x == "O" } ?  false : true

	end




	def column_has_room?( column )

		# checks if the top row is filled
		@board[ column ] == "O" ? true : false

	end


	# dropping pieces
	def prepare_to_drop( column, piece )

		# place in the desired column
		if column_has_room?( column )
			# drop the piece
			drop_piece( column, piece )
			true
		else
			draw?
			false
		end

	end


	def drop_piece( column, piece )

		# goes to the 'bottom row' of the array which is 45 + column #
		index = ( column + 45 )
		loop do

			if @board[ index ] == "O"
				@board[ index ] = piece
				break
			end

			# jump to the row above for next check
			index -= 9
		end

	end




end