require_relative 'board'
require_relative 'computer'
require_relative 'human'

class ConnectFour

	attr_reader :player1, :game_has_winner

	def initialize
		@board   = Board.new
		@game_has_winner = false
	end

	def check_input(string)
		good_inputs = ['y', 'n']
		false
		true if (good_inputs.include? string)
	end

	def print_instruction
		puts "\n\nTo play a round, enter 1 integer ranging from 1 to 7 indicating"
		puts "The column number you want to add a piece \n"
	end

	def good_round_played?(player)
		player_input = player.drop_a_piece(@board) - 1
		puts "RED  Plays #{player_input + 1}"  if     @cur_player.color == RED
		puts "BLUE Plays #{player_input + 1}"  if     @cur_player.color == BLUE
		@board.add_piece(player.color, player_input)
	end

	def initial_setup
		print_instruction
		puts "Do you want to play against computer?(y/n):"
		user_input = gets.chomp
		good_input_received = check_input user_input
		until good_input_received
			puts "Bad input, please try again : "
			user_input = gets.chomp
			good_input_received = check_input user_input
		end
		user_input
	end

	def board_filled
		@board.number_of_pos_filled == 42
	end

	def create_players(user_input)
		@player1 = Human.new(RED)
		if user_input == "y"
			@player2 = Computer.new(BLUE)
		else
			@player2 = Human.new(BLUE)
		end
	end

	def determine_next_player
		if @cur_player == @player1
			@cur_player = @player2
		else
			@cur_player = @player1
		end
	end

	def start_game
		user_input = initial_setup
		create_players user_input
		play
	end

	def play
		game_won = false
		@cur_player = @player1
		until game_won || board_filled
			until good_round_played?(@cur_player)
				puts "Cannot add piece, please select another column!"
			end
			game_won = @board.check_winning_pos(@cur_player.color)
			if game_won
				puts "\n\n#{"RED  Wins!".center(20)}\n\n"  if     @cur_player.color == RED
				puts "\n\n#{"BLUE Wins!".center(20)}\n\n"  if     @cur_player.color == BLUE
				@board.render
				@game_has_winner = true
				break
			else
				next_player = determine_next_player
				@board.render
				if board_filled
					puts "Board is filled up without a winner! Game ending...\n\n"
					break
				end
			end
		end
	end

end