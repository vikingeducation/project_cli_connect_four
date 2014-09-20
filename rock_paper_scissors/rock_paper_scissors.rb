
class Game

	@p1_choice 		= nil
	@p2_choice 		= nil

	# Start game - input num_players
		# if only 1 then create AI player

		def play

			loop do
			
				@p1_choice = @player_1.get_choice
				@p2_choice = @player_2.get_choice
				eval_winner()
				declare_winner()

			end

		end # play

		def eval_winner
			@winner = nil
			
			if @p1_choice		 == "r" && @p2_choice == "p"
				@winner = 2

			elsif @p1_choice == "r" && @p2_choice == "s"
				@winner = 1

			elsif @p1_choice == "r" && @p2_choice == "r"
				@winner = nil

			elsif @p1_choice == "s" && @p2_choice == "r"
				@winner = 1

			elsif @p1_choice == "s" && @p2_choice == "p"
				@winner = 1

			elsif @p1_choice == "s" && @p2_choice == "s"
				@winner = nil
			
			elsif @p1_choice == "p" && @p2_choice == "r"
				@winner = 1
			
			elsif @p1_choice == "p" && @p2_choice == "s"
				@winner = 2
			
			elsif @p1_choice == "p" && @p2_choice == "p"
				@winner = nil

			else
				puts "It'll never get to this point!"
			end

		end

		def declare_winner
			puts "Player 1 chose #{@p1_choice} and Player 2 chose #{@p2_choice}"
			if @winner == nil
				puts "It was a tie!"
			else
				puts "The winner is Player #{@winner.to_s}!"
				exit
			end
		end

private
	def initialize(num_players) 
		if num_players == 1
			@player_1 = Player.new(1)
			@player_2 = AI.new(2)
		else
			@player_1 = Player.new(1)
			@player_2 = Player.new(2)
		end
	end # initialize

end # Game


class Player
	
	def initialize(player_num)
		@number = player_num
	end

		@@choices = ["r","p","s"]
		

		def get_choice
			puts "Player #{@number} please choose (r)ock, (p)aper, (s)scissors"
			choice = gets.strip	
			if validate_choice(choice)
				return choice
			else
				puts "Please try again to select a valid choice\n"
				get_choice()
			end # if validate
		end	

		def validate_choice(choice)
			@@choices.include?(choice)
		end

end # Player

class AI < Player
	
		def get_choice
			return @@choices.sample
		end
end #AI


puts "How many players? (1-2)"
players = gets.chomp.to_i
rps = Game.new(players)

rps.play






