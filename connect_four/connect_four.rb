class ConnectFour

	def initialize
		# @player= Player.new
		@board = Board.new
	end

	def play
		loop do
			@board.render
			@player1.request_move # returns move
			@board.place_piece()
			@player2.request_move

			break if check_win?
		end
	end
end

class Board
	def initialize
		@board = Array.new(7){Array.new}
	end

	def render
		print "\n"
		@board.each do |column|
			print column 
			print "\n"
		end
		print "\n"
	end
	def place_piece
end

class Player

	def initialize
	end

	def request_move
		
		puts "Please choose a column to drop your piece"
		@move = gets.strip.to_i

		if is_valid?(@move)
			return @move
		else
			puts "make another move"
			request_move
		end

	end

	def is_valid?(move)
		#within the columns
		#can't be a full column
		if (0..6).any?(move-1) && @board(move-1).length < 7
	end

end

class Computer < Player
	#generates random move
end

t = ConnectFour.new
t.play