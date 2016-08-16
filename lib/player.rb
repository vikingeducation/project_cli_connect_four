class Player
	attr_accessor :name, :piece

	def initialize(name, piece, board)
		@name = name
		@piece = piece
		@board = board
	end

	def get_user_name(player)
		puts "#{player} please enter your name: "
		name = gets.chomp.capitalize
		@name = name
	end

	def get_column_number
		loop do
			puts "#{@name}, enter column number"
			column = gets.chomp.to_i - 1

			break if @board.add_piece(column, @piece)
		end
	end

	def wins?
		@board.winning_combination?(@piece)
	end
end
