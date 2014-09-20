

	# Global method
	def play()
			puts "How many players? (1-2)"
			num_players = gets.chomp.to_i
			# validate player count
			if num_players < 1 || num_players > 2
				puts "Please choose 1 or 2 players\n\n"
				play()
			end  
			rps = Game.new(num_players)
			rps.game_loop
	end #init game

class Game

	@p1_choice 		= nil
	@p2_choice 		= nil

		def game_loop

			loop do
				@p1_choice = @player_1.get_choice
				@p2_choice = @player_2.get_choice
				eval_winner
				declare_winner
				if @winner
					exit
				end # if it's a tie play again!

			end # end loop do

		end # end game loop

		def eval_winner
			if @p1_choice	== "r"
				case @p2_choice
				when "p" then	@winner = 2
				when "s" then @winner = 1
				when "r" then @winner = nil
				end # end case
			elsif @p1_choice == "p"
				case @p2_choice 
				when "p" then	@winner = nil
				when "s" then @winner = 2
				when "r" then @winner = 1
			end # end case
			else 
				case @p2_choice
				when "p" then @winner = 2
				when "s" then @winner = 1
				when "r" then @winner = nil
			end # end case
			end # end if
		end

		def declare_winner
			puts "Player 1 chose #{@p1_choice} and Player 2 chose #{@p2_choice}"
			if @winner == nil
				puts "It was a tie!\n\n"
			else
				puts "The winner is Player #{@winner.to_s}!"
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

	@@choices = ["r","p","s"]
	
	def initialize(player_num)
		@number = player_num
	end
		
	def get_choice
		puts "Player #{@number} please choose (r)ock, (p)aper, (s)scissors"
		choice = gets.strip.downcase	
		if validate_choice(choice)
			return choice
		else
			puts "Please try again to select a valid choice\n\n"
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


play






