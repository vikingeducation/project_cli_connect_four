require_relative "../lib/player.rb"
require_relative "../lib/board.rb"

class Connectfour
	def initialize
		@board = Board.new

		@player_1 = Player.new("Player 1", "X", @board)
		@player_2 = Player.new("Player 2", "O", @board)

		@current_player = @player_1
	end

	def play
		loop do
			@board.render

			@current_player.get_user_selection
			if @current_player.check_win?
				puts "Win!!!!"
				break
			end

			swap_players
		end
	end

	def swap_players
		if @current_player == @player_1
			@current_player = @player_2
		else
			@current_player = @player_1
		end
	end
end