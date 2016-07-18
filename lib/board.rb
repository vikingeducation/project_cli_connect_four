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
		if with_valid_column?(column)
			(@board_array.size-1).downto(0) do |row|
				#puts "row = #{row} & column = #{column} item =  #{item}"
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

	def with_valid_column?(column)
		(0..6).include?(column) ? true : puts("Piece Out of Bounds")
	end

	def winning_combination?(peice)
		winning_horizontal?(peice) ||
		winning_vertical?(peice) ||
		winning_diagonal?(peice)
	end

	def winning_diagonal?(peice)
		@board_array.each_with_index do |row,row_index|
			row.each_with_index do |cell,cell_index|
				count = 0
				if ((cell_index+1 < 6 && row_index+1 < 5) && (cell_index+2 < 6 && row_index+2 < 5) && (cell_index+3 < 6 && row_index+3 < 5))
					count += 1 if @board_array[cell_index][row_index] == peice
					count += 1 if @board_array[cell_index+1][row_index+1] == peice
					count += 1 if @board_array[cell_index+2][row_index+2] == peice
					count += 1 if @board_array[cell_index+3][row_index+3] == peice
				end
				return true if count == 4
			end
		end

		5.downto(0) do |row_index|
			@board_array[row_index].each_with_index do |cell,cell_index|
				count = 0
				if ((cell_index+1 < 6 && row_index-1 >= 0) && (cell_index+2 < 6 && row_index-2 >= 0) && (cell_index+3 < 6 && row_index-3 >= 0))
					count += 1 if @board_array[cell_index][row_index] == peice
					count += 1 if @board_array[cell_index+1][row_index-1] == peice
					count += 1 if @board_array[cell_index+2][row_index-2] == peice
					count += 1 if @board_array[cell_index+3][row_index-3] == peice
				end
				return true if count == 4
			end
		end
		return false
	end

	def winning_vertical?(peice)
		count = 0
		verticals.each do |veritcal|
			count = 0
			veritcal.each do |cell|
				if cell == peice
					count += 1
					break if count == 4
				else
					count = 0
				end
			end
			break if count == 4
		end
		puts count
		count == 4 ? true : false
	end

	def winning_horizontal?(peice)
		count = 0
		horizontals.each do |horizontal|
			count = 0
			horizontal.each do |cell|
				if cell == peice
					count += 1
					break if count == 4
				else
					count = 0
				end
			end
			break if count == 4
		end
		puts count
		count == 4 ? true : false
	end

	def horizontals
		@board_array
	end

	def verticals
		verticals_array = []
		0.upto(@board_array.size-1) do |i|
			verticals_array << [@board_array[0][i],@board_array[1][i],@board_array[2][i],@board_array[3][i],@board_array[4][i],@board_array[5][i]]
		end
		verticals_array
	end
end