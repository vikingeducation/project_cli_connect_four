# Controls the overall game
class RockPaperScissors
	# Set initial variables
	def initialize
		@player_1 = Human.new
		@player_2 = Computer.new
		@board = Board.new
		# Could use a constant (or @@class variable) for this
		@moves = ["rock","paper","scissors"]
		start
	end

	# Start the game!
	def start
		# Begin the loop
		loop do
			# Display board
			@board.render(@player_1.wins, @player_2.wins)

			# Get player_1 selection
			@player_1_move = @player_1.get_move

			# Get player_2 selection
			@player_2_move = @player_2.get_move

			# Who won? Returns 1 for player 1, 2 for player 2, or nil for a draw
			@winner = get_winner(@player_1_move,@player_2_move)

			# Output winner
			output_winner

			# What next?
			puts "What next? 1 to play again, 2 to quit"
			input = gets.chomp.to_i
			break if input == 2
		end
	end

	# Output winner
	def output_winner
		if @winner.nil?
			puts "We had a draw! #{@moves[@player_1_move-1]} ties #{@moves[@player_2_move-1]}"
		elsif @winner == 1
			puts "Player 1 wins! #{@moves[@player_1_move-1]} beats #{@moves[@player_2_move-1]}"
			@player_1.wins=(@player_1.wins+1)
		else
			puts "Player 2 wins! #{@moves[@player_2_move-1]} beats #{@moves[@player_1_move-1]}"
			@player_2.wins=(@player_2.wins+1)
		end
	end

	# Get winner
	def get_winner(player_1_move, player_2_move)
		moves = [player_1_move,player_2_move]
		# This means we have a draw
		if moves[0] == moves[1]
			nil
		# Scenario for P1 rock	
		elsif moves[0] == 1
			return 1 if moves[1] == 3
			return 2
		# Scenario for P1 paper
		elsif moves[0] == 2
			return 1 if moves[1] == 1
			return 2
		# Scenario for P1 scissors
		elsif moves[0] == 3
			return 1 if moves[1] == 2
			return 2
		end
	end
end

# Controls the "board" for the game
# In RPS there isn't much board so this
# will control the output.
class Board
	# Clear board
	def clear
		system "clear"
	end

	# Render
	def render(player_1_wins= 0,player_2_wins=0)
		output = "
ROCK PAPER SCISSORS
-------------------
You know how to play!
Enter: 
1 for rock, 
2 for paper, or 
3 for scissors. Good luck!

SCORE
--------------------
Player 1: #{player_1_wins}
Player 2: #{player_2_wins}\n"
		clear
		print output
	end
end

# Create a new player, this will be the
# human-interaction portion.
class Player
	# Instead of this could have another method 
	# which just increments wins
	attr_accessor :wins
	
	# Initialize, get number of wins
	def initialize
		@wins = 0
	end

	# Validate move
	def valid_move?(move)
		# Make sure input is an integer
		if move.class == Fixnum

			# Make sure move is 1-3
			if (1..3).to_a.include?(move)
				true
			else
				false
			end
		else
			false
		end
	end
end

# Create Human player
class Human < Player
	# Human version of get_move
	def get_move
		error_message = nil
		loop do
			puts error_message || "Select your move:"
			move = gets.chomp.to_i
			if valid_move?(move)
				return move
				break
			else
				error_message = "Invalid input, please enter a number 1-3"
				redo
			end
		end
	end
end

# Create a new computer player.
class Computer < Player
	# Computer version of get_move
	def get_move
		rand(1..3)
	end
end

RockPaperScissors.new