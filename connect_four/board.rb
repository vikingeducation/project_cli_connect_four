require 'colorize'
require_relative 'constants'

class Board
	attr_accessor :number_of_pos_filled, :board_array
	def initialize
		@number_of_pos_filled = 0
		@board_array = []
		@board_array[0] = [0,0,0,0,0,0,0]
		@board_array[1] = [0,0,0,0,0,0,0]
		@board_array[2] = [0,0,0,0,0,0,0]
		@board_array[3] = [0,0,0,0,0,0,0]
		@board_array[4] = [0,0,0,0,0,0,0]
		@board_array[5] = [0,0,0,0,0,0,0]
	end

	def output_possible_plays
		possibles_array = []
		7.times do |index|
			if @board_array[0][index] == NO_COLOR
				possibles_array << (index + 1)
			end
		end
		possibles_array
	end

	def remove_piece(col)
		removed = false
		7.times do |index_outer|
			5.downto(0) do |index|
				if col == index_outer
					if @board_array[index][index_outer] == NO_COLOR
						@board_array[index+1][index_outer] = NO_COLOR
						removed = true
					end
				end
			end
		end
		unless removed
			@board_array[0][col] = NO_COLOR
		end
	end

	def add_piece(color, col)
		return_val = false
		7.times do |index_outer|
			5.downto(0) do |index|
				if col == index_outer
					if @board_array[index][index_outer] == 0
						@board_array[index][index_outer] = color
						@number_of_pos_filled += 1
						return_val = true
						break
					end
				end
			end
		end
		return_val
	end

	def check_line(line, color)
		return_val = false
		possible_win_pos = line.size - 3
		possible_win_pos.times do |index|
			start_pos = index
			end_pos = index + 3
			sub_line = line[start_pos..end_pos]
			if sub_line.all? {|item| item == color}
				return_val = true
			end
		end
		return_val
	end

	def check_winning_pos_horiz(color, printable)
		return_val = false
		printed = false || printable
		6.times do	|index|
			return_val = return_val | check_line(@board_array[index], color)
			if return_val
				unless printed
					print "Winning Pos Found On Row #{index} For "
					print "RED\n"  if     color == RED
					print "BLUE\n" unless color == RED
					printed = true
				end
			end
		end
		return_val
	end

	def check_winning_pos_vertic(color, printable)
		return_val = false
		printed = false || printable
		vertic_array = []
		7.times do |col|
			6.times do	|index|
				vertic_array[index] = @board_array[index][col]
			end
			return_val = return_val | check_line(vertic_array, color)
			if return_val
				unless printed
					print "Winning Pos Found On Col #{col} For "
					print "RED\n"  if     color == RED
					print "BLUE\n" unless color == RED
					printed = true
				end
			end
		end
		return_val
	end

	def check_winning_pos_diag(color, printable)
		return_val = false
		printed = false || printable
		6.times do |row|
			7.times do |col|
				if col < 4
					if row < 3
						diag_line = make_diag_line_l_to_r(row, col)
						return_val = return_val | check_line(diag_line, color)
						if return_val
							unless printed
								print "Winning Pos Found On Row #{row} and Col #{col} Diag Left To Right For "
								print "RED\n"  if     color == RED
								print "BLUE\n" unless color == RED
								printed = true
							end
						end
					end
				else
					if row < 3
						diag_line = make_diag_line_r_to_l(row, col)
						return_val = return_val | check_line(diag_line, color)
						if return_val
							unless printed
								print "Winning Pos Found On Row #{row} and Col #{col} Diag Right To Left For "
								print "RED\n"  if     color == RED
								print "BLUE\n" unless color == RED
								printed = true
							end
						end
					end
				end
			end
		end
		return_val
	end

	def check_winning_pos(color, printable)
		return_val = false
		return_val = return_val | check_winning_pos_horiz(color, printable)
		return_val = return_val | check_winning_pos_vertic(color, printable)
		return_val = return_val | check_winning_pos_diag(color, printable)
		return_val
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