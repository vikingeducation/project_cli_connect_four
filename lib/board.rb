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
			@board_array.each_with_index do |item,row|
				#puts "row = #{row} & column = #{column} item =  #{item}"
				if item[column].nil?
					@board_array.reverse[row][column] = peice
					@last_move = [row,column]
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

end