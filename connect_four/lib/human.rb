require_relative 'constants'

class Human

	attr_reader :color, :move

	def initialize(color)
		@color = color
	end
	
	def color_string
		if @color == BLUE
			"BLUE"
		else
			"RED"
		end
	end

	def check_input(input)
		@move = input.to_i
		((is_integer?(input)) && (is_legal_column?(input))) ? true : false
	end

	def is_integer?(input)
		(input.to_i.to_s == input) ? true : false
	end

	def is_legal_column?(input)
		((input.to_i > 0) && (input.to_i < 8)) ? true : false
	end

	def get_input
		puts "It is #{color_string}\'s  turn, please select a column:"
		loop do
			break if check_input(gets.chomp)
			puts "Bad input, please try again : "
		end
	end

	def drop_a_piece(board = nil)
		get_input
		@move
	end

end