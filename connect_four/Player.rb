
require 'pry'

class Player


attr_accessor :board, :name, :piece

	def initialize( name = "Joe", piece, board )

		@name = name
		@piece = piece
		@board = board


	end





	# each player will have 21 pieces
	# player one will get Red
	# player 2 will get Blue

	# the board will be displayed
	# player one will make their first move
	def get_move

		loop do

			move = ask_for_move

			# validate correct column
			if valid_column?( move )

				# then validate column is not full
				if @board.valid_placement?( move, @piece )
					break
				end

			end

		end

	end
	# unless the move is invalid

	def valid_column?( move )

	  (1..7) === move

	end





	def ask_for_move

		Board.message("#{@name}#{piece}, enter which column number to place your piece")
		return gets.strip.to_i

	end




	def process_move
	# the piece is dropped

	end
	# then turns will change

	# play will continue with each each move being
	# checked for validitity and if there are 4 in a row
	# A draw will happen if the board is full

end