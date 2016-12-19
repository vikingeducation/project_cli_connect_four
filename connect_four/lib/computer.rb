require_relative 'board'
require_relative 'deep_dup'
require_relative 'constants'

class Computer

	attr_reader :color, :move

	def initialize(color)
		@color = color
	end

	def drop_a_piece(board)
		pick_a_column(board)
		@move
	end

	def pick_a_column(board)
		unless win_position_found? board
			@move = board.available_columns.sample
		end
	end

	def win_position_found?(board)
		possible_games = board.available_columns
		player_board = Board.new
		player_board.board_array = board.board_array.deep_dup
		possible_games.each do |cur_col|
			piece_added = player_board.add_piece(@color, cur_col)
			if piece_added
				if player_board.check_winning_pos(@color)
					@move = cur_col + 1
					player_board.render
					return true
				end
				player_board.remove_piece(cur_col)
			end
		end
		false
	end

end