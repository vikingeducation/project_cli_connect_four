
require 'pry'

class Player

QUIT = "q", "exit", "quit"

attr_accessor :board, :name, :piece

	def initialize( name = "Joe", piece, board )

		@name = name
		@piece = piece
		@board = board


	end


	def get_move( column = nil )

		loop do

			column = ask_for_move

			exit?( column )

			if valid_column?( column )

				if @board.prepare_to_drop( column, @piece )

					break

				end

			end

		end

	end



	def valid_column?( column )

	  (1..7) === column

	end



	def ask_for_move

		@board.message("#{@name}#{piece}, enter which column number to place your piece")

		input = gets.strip
		exit?( input )

		return input.to_i

	end

	def exit?( input )

		exit if QUIT.include?( input )

	end

end