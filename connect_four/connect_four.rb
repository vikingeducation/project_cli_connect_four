# Get pry for testing
require "pry"

# Require our other classes
require './board.rb'
require './player.rb'

# Set constants
NUM_ROWS = 6
NUM_COLUMNS = 7
BOTTOM_ROW = NUM_ROWS-1

class Connect4
	# Initialize
	def initialize
		@board = Board.new
		@player_1 = Human.new("X", "Player 1")
		@player_2 = Human.new("O", "Player 2")
		# Begin game, param is starting player
		begin_game(@player_1)
	end

	# Begin the game
	def begin_game(starting_player)
		# Current player is set to starting player the first time
		current_player = starting_player

		# Start the loop
		loop do
			@board.render
			puts "It's #{current_player.name}'s turn!"
			current_column = current_player.select_column(@board)-1

			# Make the move
			@board.add_piece(current_column, current_player.piece)

			# Check for victory
			break if @board.is_victory?

			# Check for draw
			break if @board.is_board_full?

			# Switch player
			current_player = switch_player(current_player)
		end
	end

	# Switch player
	def switch_player(current_player)
		current_player == @player_1 ? @player_2 : @player_1
	end
end

Connect4.new