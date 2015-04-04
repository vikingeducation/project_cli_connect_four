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
		output_buffer = ""
		@board.each do |row|
			output_buffer << row.join(' ') + "\n"
		end
		print output_buffer
	end
end