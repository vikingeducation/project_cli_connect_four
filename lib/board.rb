#equire 'colorize'

class Board
	attr_reader :board_array, :last_move

	def initialize( board_array = nil)
		@board_array = board_array || Array.new(6) { Array.new(7) }
		@last_move = [nil,nil]
	end

	def render
		puts
		@board_array.each do |row|
			row.each do |column|
				column.nil? ? print("-") : print(column.to_s)
			end
			puts
		end
	end

	def add_piece(column, peice)
		if valid_column?(column)
			(@board_array.size-1).downto(0) do |row|
				if @board_array[row][column].nil?
					@board_array[row][column] = peice
					return true
					break
				end
			end
			return false
		else
			return false
		end
	end

	def valid_column?(column)
		(0..6).include?(column) ? true : puts("Column doesn't exist").colorize(:red)
	end

	def winning_combination?(peice)
		winning_horizontal?(peice) ||
		winning_vertical?(peice) ||
		winning_diagonal?(peice)
	end

	def winning_diagonal?(peice)
		@board_array.each_with_index do |row,row_index|
			row.each_with_index do |cell,cell_index|
				i = 0
				if ((cell_index+1 < 6 && row_index+1 < 5) && (cell_index+2 < 6 && row_index+2 < 5) && (cell_index+3 < 6 && row_index+3 < 5))
					count += 1 if @board_array[cell_index][row_index] == peice
					count += 1 if @board_array[cell_index+1][row_index+1] == peice
					count += 1 if @board_array[cell_index+2][row_index+2] == peice
					count += 1 if @board_array[cell_index+3][row_index+3] == peice
				end
				return true if i == 4
			end
		end

		5.downto(0) do |row_index|
			@board_array[row_index].each_with_index do |cell,cell_index|
				i = 0
				if ((cell_index+1 < 6 && row_index-1 >= 0) && (cell_index+2 < 6 && row_index-2 >= 0) && (cell_index+3 < 6 && row_index-3 >= 0))
					i += 1 if @board_array[cell_index][row_index] == peice
					i += 1 if @board_array[cell_index+1][row_index-1] == peice
					i += 1 if @board_array[cell_index+2][row_index-2] == peice
					i += 1 if @board_array[cell_index+3][row_index-3] == peice
				end
				return true if i == 4
			end
		end
		return false
	end

	def winning_vertical?(peice)
		i = 0
		verticals.each do |veritcal|
			i = 0
			veritcal.each do |cell|
				if cell == peice
					i += 1
					break if i == 4
				else
					i = 0
				end
			end
			break if i == 4
		end
		puts i
		i == 4 ? true : false
	end

	def winning_horizontal?(peice)
		i = 0
		horizontals.each do |horizontal|
			i = 0
			horizontal.each do |cell|
				if cell == peice
					i += 1
					break if i == 4
				else
					i = 0
				end
			end
			break if i == 4
		end
		puts i
		i == 4 ? true : false
	end

	def horizontals
		@board_array
	end

	def verticals
		array = []
		0.upto(@board_array.size-1) do |i|
			array << [@board_array[0][i],@board_array[1][i],@board_array[2][i],@board_array[3][i],@board_array[4][i],@board_array[5][i]]
		end
		array
	end
end
