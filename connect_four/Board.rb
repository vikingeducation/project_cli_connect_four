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
		mid_index = 4
		four_in_a_row = player_pieces_as_string( piece )
		begin
		# the middle index in a row must must have something for there to be a possible win
			if @board[ mid_index ] != "O"
				row = @board[ (mid_index - 3)..(mid_index + 3) ].join

				return true if row.include?( four_in_a_row )
			end

		mid_index += 9

		end until mid_index > 49

	end


	def four_in_a_column( piece )

		# start of the first indexes of row 3 and 4
		third_row_start_index = 19
		fourth_row_start_index = 28

		# refactor
		row_of_four = player_pieces_as_string( piece )

		begin
		# the 3rd and 4th indexes in a column must have something for a 4 in a row to be possible
			if @board[ third_row_start_index ] == piece &&
				 @board[ fourth_row_start_index ] == piece

				column = get_column_string( third_row_start_index )

				return true if column.include?( row_of_four )
			end

		third_row_start_index += 1
		fourth_row_start_index += 1

		end until third_row_start_index > 25
		# return false

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


	def four_in_a_diagonal( piece )

		four_in_a_row = player_pieces_as_string( piece )
	  # there are 6 left-to-right diags to check who's array indices are separated by 10
	  index = 1
	  until index > 25

	  	if (1..3) ===  index || index == 10 || index == 19
	  		return true if process_diagonal( index, "right" ).include?( four_in_a_row )
	  	elsif (5..7) === index || index == 16 || index == 25
	  		return true if process_diagonal( index, "left" ).include?( four_in_a_row )
	  	elsif index == 4
	  		return true if
	  			process_diagonal( index, "right" ).include?( four_in_a_row )|| process_diagonal( index, "left" ).include?( four_in_a_row )
	  	end
	  	index += 1

	  end


	end


	def process_diagonal( index, direction )

		arr = []
		until @board[ index ] == nil || @board[ index ].is_a?( Fixnum )
			arr << @board[ index ]
			direction == "right" ? index += 10 : index += 8
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