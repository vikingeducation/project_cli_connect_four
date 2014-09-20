
class Game

	@p1_choice 		= nil
	@p2_choice 		= nil

	# Start game - input num_players
		# if only 1 then create AI player

		def play()

		end # play

		def prompt_choice(which_player)
			@p1_choice = @player_1.get_choice

		end

	## game_loop
		# prompt for choice P1
		# prompt for choice P2 (maybe AI)
		# eval_winner
			# check using case statement

		# output choices and winner

private
	def initialize(num_players) 
		@num_players = num_players
		if @num_players == 1
			@player_1 = Player.new
			@player_2 = AI.new
		else
			@player_1 = Player.new
			@player_2 = Player.new
		end
	end # initialize

end # Game


class Player
	protected
		choices = ["r","p","s"]

		def get_choice
			puts "Please chose (r)ock, (p)aper, (s)scissors"
			choice = gets.strip	
			if validate_choice(choice)
				return choice
			else
				puts "Please try again to select a valid choice"
				get_choice()
			end # if validate
		end	

		def validate_choice(choice)
			choices.include?(choice)
		end

end # Player

class AI < Player
	protected
		def get_choice
			return choices.sample
		end
end #AI
