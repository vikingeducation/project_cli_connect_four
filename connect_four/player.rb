class Player
	attr_reader :piece, :name

	# Initialize player
	def initialize(piece, name)
		@piece = piece
		@name = name
	end

	# See if we have a valid input. Just seeing
	# if this is a number 1..NUM_COLUMNS
	def valid_input?(input)
		if (1..NUM_COLUMNS).to_a.include?(input)
			true
		else
			false
		end
	end
end

class Human < Player
	# Make a move
	def make_move
		error_message, input = nil, nil
		loop do
			puts error_message || "Enter the column number you'd like to select:"
			input = gets.chomp.to_i
			break if valid_input?(input)
			error_message = "Invalid Input. Enter column number 1-#{NUM_COLUMNS}"
			redo		
		end
		input
	end
end

class AI < Player

end
