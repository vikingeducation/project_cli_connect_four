require 'colorize'
require_relative 'constants'

class Board
	attr_accessor :number_of_pos_filled, :board_array
	attr_reader :number_of_rows, :number_of_cols

	def initialize(num_rows = 6, num_cols = 7)
		@number_of_pos_filled = 0
		@number_of_rows = num_rows
		@number_of_cols = num_cols
		@board_array = []
		@board_array[0] = [0,0,0,0,0,0,0]
		@board_array[1] = [0,0,0,0,0,0,0]
		@board_array[2] = [0,0,0,0,0,0,0]
		@board_array[3] = [0,0,0,0,0,0,0]
		@board_array[4] = [0,0,0,0,0,0,0]
		@board_array[5] = [0,0,0,0,0,0,0]
	end

	def board_array_column
		@board_array.transpose
	end

	def available_columns
		@board_array[0].each_index.select{|i| @board_array[0][i] == NO_COLOR}
	end

	def remove_piece(col)
		index_to_remove = board_array_column[col].each_index.select{|i| board_array_column[col][i] == NO_COLOR}.max
		if index_to_remove
			@board_array[index_to_remove + 1][col] = NO_COLOR
		else
			@board_array[0][col] = NO_COLOR
		end
	end

	def add_piece(color, col)
		if board_array_column[col][0] == NO_COLOR
			index_to_add = board_array_column[col].each_index.select{|i| board_array_column[col][i] == NO_COLOR}.max
			@board_array[index_to_add][col] = color
			@number_of_pos_filled += 1
			true
		else
			false
		end
	end

	def check_line(line, color)
		return_val = false
		possible_win_pos = line.size - 3
		possible_win_pos.times do |index|
			start_pos = index
			end_pos = index + 3
			if line[start_pos..end_pos].all? {|item| item == color}
				return true
			end
		end
		false
	end

	def check_winning_pos_horiz(color)
		@board_array.each do |row|
			if check_line(row, color)
				return true
			end
		end
		false
	end

	def check_winning_pos_vertic(color)
		board_array_column.each do |col|
			if check_line(col, color)
				return true
			end
		end
		false
	end

	def check_winning_pos_diag(color)
		@number_of_rows.times do |row|
			@number_of_cols.times do |col|
				if col < 4 && row < 3
					diag_line = make_diag_line_l_to_r(row, col)
					if check_line(diag_line, color)
						return true
					end
				elsif row < 3
					diag_line = make_diag_line_r_to_l(row, col)
					if check_line(diag_line, color)
						return true
					end
				end
			end
		end
		false
	end

	def check_winning_pos(color)
		check_winning_pos_horiz(color) || check_winning_pos_vertic(color) || check_winning_pos_diag(color)
	end

	def make_diag_line_l_to_r(row, col)
		ret_line = []
		i = row
		j = col
		while(i < 6 && j < 7)
			ret_line << @board_array[i][j]
			i += 1
			j += 1
		end
		ret_line
	end

	def make_diag_line_r_to_l(row, col)
		ret_line = []
		i = row
		j = col
		while(i < 6 && j >= 0)
			ret_line << @board_array[i][j]
			i += 1
			j -= 1
		end
		ret_line
	end

	def render
		puts "************************************"
		color_hash = ["∙ ", "● ".red, "● ".blue]
		@board_array.each_with_index do |item, index|
			item.each_with_index do	|internal_item, internal_index|
				print color_hash[internal_item]
			end
			print "\n"
		end
		puts "************************************"
	end
end