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

	def initialize

		@board = default_state

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

		puts ""

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
		@board.any? { | x | x == "O" } ?  false : true

	end




	def column_has_room?( column )

		# checks if the top row is filled
		@board[ column ] == "O" ? true : false

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



	def remove_piece( column, piece )

		# goes to the 'top row' of the array which is 45 + column #
		index = column
		loop do

			if @board[ index ] == piece

				# replace the dropped piece to try again
				@board[ index ] = "O"
				break

			end

			# jump to the next row down for next check
			index += 9
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

		@board.each_with_index do | e, i |

			# grab column 1 through 7
			if (1..7) === i

				# '-' separates each column to check for win
				board_col_array << "-"

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

		until @board[ index ] == nil || @board[ index ] == "]" || @board[ index ] == "[" || @board[ index ] == "-" || board[ index ].is_a?( Fixnum )

			arr << @board[ index ]

			# depending on the direction of the diagnoal the index increments either 8 or 10
			direction == "right" ? index += 10 : index += 8

		end

		return arr.join

	end


def player_pieces_as_string( piece )

		return piece.to_s * 4

	end



	def four_in_a_row( piece )

		return true if board_as_string_row.include?( player_pieces_as_string( piece ))

	end



	def four_in_a_column( piece )

		return true if board_as_string_col.include?( player_pieces_as_string( piece ) )

	end





	def four_in_a_diagonal( piece )

	  return true if board_as_string_diagonal.include?( player_pieces_as_string( piece ) )

	end

end