=begin

	public

		attr accessor board

		initialize

			@board

		render
		message( message )
		victory?
		draw?
		column has room?
		prepare to drop
		drop piece
		remove piece

	private

		default state
		board as string row
		" column
		" diagonal
	  process_diagonal( index, direction )
    player_pieces_as_string( piece )
		four_in_a_row( piece )
		four_in_a_column( piece )
		four_in_a_diagonal( piece )




=end


class Board

	attr_accessor :board

	def initialize( board = nil )

		@board = default_state if board == nil

	end



	# the board will only display the current status
	def render

		puts ""

		@board.each do | row |

			row.each { | col | print col }
			puts ""

		end

		print "-1234567-"

		puts ""

	end


	def message( message )

		puts ""
		puts message
		puts ""

	end


	def victory?( piece )

		return true if four_in_a_row( piece )

		return true if four_in_a_column( piece )

		return true if four_in_a_diagonal( piece )

	end




	def draw?

		# determine if all positions are filled
		@board[0].join.include?("O") ?  false : true

	end




	def column_has_room?( column )

		# checks if the top row is filled
		@board[ 0 ][ column ] == "O" ? true : false

	end


	def prepare_to_drop( column, piece )

		if column_has_room?( column )

			drop_piece( column, piece )

			true

		else

			draw?

			false

		end

	end


	def drop_piece( column, piece )

		# goes to the 'bottom row' of the array which is 45 + column #
		index = 5
		loop do

			if @board[ index ][ column ] == "O"

				@board[ index ][ column ] = piece

				break

			end

			# jump to the row above for next check
			index -= 1

		end

	end



	def remove_piece( column, piece )

		# goes to the 'top row' of the array which is 45 + column #
		index = 0
		loop do

			if @board[ index ][ column ] == piece

				# replace the dropped piece to try again
				@board[ index ][ column ] = "O"
				break

			end

			# jump to the next row down for next check
			index += 1
		end

	end


#private

	# setting up the game board
	def default_state

		return [
						 "-", "O", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "O", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "O", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "O", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "O", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "O", "O", "O", "O", "O", "O", "O", "-"
	 				 ]
	end

	# generate a string to check rows
	def board_as_string_row

		return @board.join

	end




	# generate a string to check columns
	def board_as_string_col

		board_col_array = []

		col = 1

		until col > 7

			row = 0
			board_col_array << "-"

			until row > 5

				board_col_array << @board[ row ][ col ]
				row += 1

			end

			col += 1

		end

		return board_col_array.join


	end


	def board_as_string_diagonal

		board_diag_array = []

		@board.each_with_index do | e, i |

				# each possible diagonal starts at the index number below
				if (1..3) === i || i == 10 || i == 19
			 		board_diag_array << process_diagonal( i, "right" )

				elsif (5..7) === i || i == 16 || i == 25

	  		  board_diag_array << process_diagonal( i, "left" )

	  		elsif i == 4

	  			board_diag_array << process_diagonal( i, "right" )
	  			board_diag_array << process_diagonal( i, "left" )

	  		end

	  end


	  return board_diag_array.join("-")



	end




	def process_diagonal( index, direction )

		# stores an array of each diagnoal string we can check
		arr = []
=begin
	[ 0,1 ][ 0,2 ][ 0,3 ][ 0,4 ][ 0,5 ][ 0,6 ][ 0,7 ]
	[ 1,1 ][ 1,2 ][ 1,3 ][ 1,4 ][ 1,5 ][ 1,6 ][ 1,7 ]
	[ 2,1 ][ 2,2 ][ 2,3 ][ 2,4 ][ 2,5 ][ 2,6 ][ 2,7 ]
	[ 3,1 ][ 3,2 ][ 3,3 ][ 3,4 ][ 3,5 ][ 3,6 ][ 3,7 ]
	[ 4,1 ][ 4,2 ][ 4,3 ][ 4,4 ][ 4,5 ][ 4,6 ][ 4,7 ]
	[ 5,1 ][ 5,2 ][ 5,3 ][ 5,4 ][ 5,5 ][ 5,6 ][ 5,7 ]


=end

		row = 0
		col = 1

		until "done"

			arr << "-"

			until @board[ row ][ col ] == nil

				arr << @board[ row ][ col ]

				col += 1
				row += 1

			end

		end

		return arr.join

	end


	def player_pieces_as_string( piece )

		return piece.to_s * 4

	end



	def four_in_a_row( piece )
binding.pry
		return true if board_as_string_row.include?( player_pieces_as_string( piece ))

	end



	def four_in_a_column( piece )


		return true if board_as_string_col.include?( player_pieces_as_string( piece ) )

	end





	def four_in_a_diagonal( piece )

	  return true if board_as_string_diagonal.include?( player_pieces_as_string( piece ) )

	end

end