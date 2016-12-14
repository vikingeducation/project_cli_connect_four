class Player

	attr_reader :color

	def initialize(type = HUMAN, color)
		@type = type
		@color = color
	end
	def check_input(input)
		result = true
		unless input.to_i.to_s == input
			result = false
		end
		if input.to_i < 1 || input.to_i > 7
			result = false
		end
		result
	end
	def get_input(possible_games = nil)
		if @type == HUMAN
			puts "It is RED's turn, please select a column:"  if     @color == RED
			puts "It is BLUE's turn, please select a column:"  if     @color == BLUE
			user_input = gets.chomp
			good_input_received = check_input user_input
			until good_input_received
				puts "Bad input, please try again : "
				user_input = gets.chomp
				good_input_received = check_input user_input
			end
			input = user_input.to_i
			input
		else
			input = possible_games.sample
			input
		end
	end
end