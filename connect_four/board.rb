class Board
	# Initialize the board
	def initialize
		@board = create_new_board
	end

	# Create a new board
	def create_new_board
		output = []
		NUM_ROWS.times do |row|
			output[row] = []
			NUM_COLUMNS.times do
				output[row] << "-"
			end
		end
		# Add a footer row
		output[NUM_ROWS] = (1..NUM_COLUMNS).to_a.map(&:to_s)
		output
	end

	# Clear CLI
	def clear
		system "clear"
	end

	# Render board
	def render
		clear
		output_buffer = "---------------\n   CONNECT 4   \n---------------\n"
		@board.each do |row|
			output_buffer << row.join(' ') + "\n"
		end
		print output_buffer
	end

	# Add a piece
	def add_piece(column, piece)
		# Say column is empty initially
		empty_column = true
		0.upto(NUM_ROWS-2) do |row|
			unless @board[row+1][column] == "-"
				@board[row][column] = piece
				# If we get this far, the column
				# isn't empty.
				empty_column = false
				break
			end
		end
	
		@board[NUM_ROWS-1][column] = piece if empty_column

	end

	# Is the selected column playable?
	def playable_column?(column)
		@board[0][column] == "-" ? true : false
	end

	# Did someone win?
	def is_victory?
		vertical_victory? || horizontal_victory? || diagonal_up_victory? || diagonal_down_victory?
	end

	# Vertical victory?
	def vertical_victory?
		victory = false
		# Cycles through all columns
		0.upto(NUM_COLUMNS-1) do |column|
			# Cycles from bottom row down to row 3 (really row 4).
			# This doesn't need to change since the check length
			# will always be 4.
			BOTTOM_ROW.downto(3) do |row|
				temp_array = []
				temp_array << @board[row][column] << @board[row-1][column] << @board[row-2][column] << @board[row-3][column]
				unless temp_array.all? {|element| element == "-"}
					if temp_array.uniq.length == 1
						victory = true
						break
					end
				end
			end
		end
		victory
	end

	# Horizontal victory?
	def horizontal_victory?
		victory = false
		# Cycles through all rows
		BOTTOM_ROW.downto(0) do |row|
			# Cycles from left-most column to row 3 (really row 4).
			# This doesn't need to change since the check length
			# will always be 4.
			0.upto(NUM_COLUMNS-4) do |column|
				temp_array = []
				temp_array << @board[row][column] << @board[row][column+1] << @board[row][column+2] << @board[row][column+3]
				unless temp_array.all? {|element| element == "-"}
					if temp_array.uniq.length == 1
						victory = true
						break
					end
				end
			end
		end
		victory
	end

	# Diagonal up victory?
	def diagonal_up_victory?
		victory = false
		# Cycles down to the 3rd row from the top
		# this will always stay the same.
		BOTTOM_ROW.downto(3) do |row|
			# Cycles from left-most column to row 3 (really row 4).
			# This doesn't need to change since the check length
			# will always be 4.
			0.upto(NUM_COLUMNS-4) do |column|
				temp_array = []
				temp_array << @board[row][column] << @board[row-1][column+1] << @board[row-2][column+2] << @board[row-3][column+3]
				unless temp_array.all? {|element| element == "-"}
					if temp_array.uniq.length == 1
						victory = true
						break
					end
				end
			end
		end
		victory
	end

	# Diagonal down victory?
	def diagonal_down_victory?
		victory = false
		# Cycles up to the 4th row from the bottom
		# this will always stay the same.
		0.upto(BOTTOM_ROW-3) do |row|
			# Cycles from left-most column to row 3 (really row 4).
			# This doesn't need to change since the check length
			# will always be 4.
			0.upto(NUM_COLUMNS-4) do |column|
				temp_array = []
				temp_array << @board[row][column] << @board[row+1][column+1] << @board[row+2][column+2] << @board[row+3][column+3]
				unless temp_array.all? {|element| element == "-"}
					if temp_array.uniq.length == 1
						victory = true
						break
					end
				end
			end
		end
		victory
	end
	# Is the board full?
	def is_board_full?
		@board[0].all? {|item| item != "-"} ? true : false
	end
end