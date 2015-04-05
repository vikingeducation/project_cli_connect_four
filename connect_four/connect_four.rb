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
		if has_AI?
			@player_1 = Human.new("X", "Player 1")
			@player_2 = AI.new("O", "Player 2")
		else
			@player_1 = Human.new("X", "Player 1")
			@player_2 = Human.new("O", "Player 2")
		end
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

		# Output the proper ending
		output_ending(current_player)
	end

	# Switch player
	def switch_player(current_player)
		current_player == @player_1 ? @player_2 : @player_1
	end

	# Determins whether the user wants to play 
	# against a person or AI.
	def has_AI?
		output, error_message = nil, nil # So that I can get it outside of the loop after
		loop do
			@board.clear
			puts "Welcome to Connect 4 by Trevor Elwell! How would you like to play?"
			puts error_message || "Enter 1 to play against a computer. Enter 2 for 2-player mode."
			input = gets.chomp.to_i
			if input == 1 or input == 2
				# Make has_AI? return true if user selected to play against a computer
				input == 1 ? output = true : output = false
				break
			else
				error_message = "Invalid input, please enter 1 for 1-player or 2 for 2-player."
				redo
			end
		end
		output
	end

	# Output the proper ending
	def output_ending(current_player)
		@board.render
		puts @board.is_victory? ? "Congratulations! #{current_player.name} won! Thanks for playing :)" : "Looks like we have a draw. Good job playing defense players!"
	end
end

Connect4.new