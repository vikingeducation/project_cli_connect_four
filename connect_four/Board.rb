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


	# determining victory
	def victory?

		#find if 4 colors are in a row

	end
	# determining a draw

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
				# after piece dropped should check victory


				break
			end

			# jump to the row above for next check
			index -= 9
		end

	end




end