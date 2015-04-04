# Get pry for testing
require "pry"

# Require our other classes
require './board.rb'
require './player.rb'

# Set constants
NUM_ROWS = 6
NUM_COLUMNS = 7

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
			current_move = current_player.make_move

		end
	end
end

Connect4.new