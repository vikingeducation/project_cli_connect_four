require_relative 'board'
require_relative 'player'

class ConnectFour
	def initialize
		@board = Board.new
	end

	def check_input(string)
		if string == "y"
			true
		elsif string == "n"
			true
		else
			false
		end
	end

	def print_instruction
		puts "\n\nTo play a round, enter 1 integer ranging from 1 to 7 indicating"
		puts "The column number you want to add a piece \n"
	end

	def play_one_round(player)
		player_input = player.get_input(@board.output_possible_plays) - 1
		piece_added = @board.add_piece(player.color, player_input)
		piece_added
	end

	def play
		game_won = false
		game_finished = false
		i = 0
		print_instruction
		player1 = Player.new(RED)
		puts "Do you want to play against computer?(y/n):"
		user_input = gets.chomp
		good_input_received = check_input user_input
		until good_input_received
			puts "Bad input, please try again : "
			user_input = gets.chomp
			good_input_received = check_input user_input
		end
		if user_input == "y"
			player2 = Player.new(COMPUTER, BLUE)
		else
			player2 = Player.new(BLUE)
		end
		@cur_player = player1
		until game_won || game_finished
			piece_added = false
			until piece_added
				piece_added = play_one_round @cur_player
				unless piece_added
					puts "Cannot add piece, please select another column!"
				end
			end
			game_won = @board.check_winning_pos @cur_player.color
			game_finished = (@board.number_of_pos_filled == 42)
			unless game_won
				if @cur_player == player1
					@cur_player = player2
				else
					@cur_player = player1
				end
				i += 1
			else
				puts "\n\n         RED  Wins!\n\n"  if     @cur_player.color == RED
				puts "\n\n         BLUE Wins!\n\n"  if     @cur_player.color == BLUE
			end
			if game_finished
				puts "Board is filled up without a winner! Game ending...\n\n"
			end
			@board.render
		end
	end

end

game = ConnectFour.new
game.play