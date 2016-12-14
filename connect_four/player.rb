require_relative 'deep_dup'
require_relative 'board'

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
	def get_input(possible_games = nil, board_array = nil)
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
			win_pos_found = false
			no_win_pos_possible = false
			new_board_array = board_array.deep_dup
			player_board = Board.new
			player_board.board_array = new_board_array
			1.upto(7) do |cur_col|
				if possible_games.include? cur_col
					piece_added = player_board.add_piece(@color, cur_col)
					if piece_added
						win_position_available = player_board.check_winning_pos(@color, true)
						if win_position_available
							input = cur_col + 1
							win_pos_found = true
							player_board.render
							break
						else
							player_board.remove_piece(cur_col)
						end
					end
				end
			end
			if win_pos_found
				input
			else
				input = possible_games.sample
				input
			end
			input
		end
	end
end