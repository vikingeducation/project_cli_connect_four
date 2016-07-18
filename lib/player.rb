class Player
	attr_accessor :name, :piece

	def initialize(name = "Temp Name",piece,board)
		@name = name
		@piece = piece
		@board = board
	end

	def get_user_selection
		loop do
			puts "#{@name} - #{@piece}, enter the column to put piece in"
			user_input = gets.strip.to_i

			break if @board.add_piece(user_input, @piece)
		end
	end

	def check_win?
		@board.winning_combination?(@piece)
	end
end