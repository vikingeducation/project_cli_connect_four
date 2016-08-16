require_relative "player.rb"
require_relative "board.rb"

class Game
	def initialize
		@board = Board.new

		@player1 = Player.new("Player 1", "X", @board)
		@player2 = Player.new("Player 2", "O", @board)

		@current_player = @player1
	end

	def play
		@player1.get_user_name(@player1.name)
		@player2.get_user_name(@player2.name)

		loop do
			@board.render

			@current_player.get_column_number
			if @current_player.wins?
				puts "#{@current_player.name} wins!"
				break
			end

			switch_players
		end
	end

	def switch_players
		if @current_player == @player1
			@current_player = @player2
		else
			@current_player = @player1
		end
	end
end


game = Game.new
game.play
