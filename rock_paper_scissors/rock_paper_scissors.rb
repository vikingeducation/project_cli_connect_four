# File:           connect_four.rb
# Purpose:        Week 2 paired project for the Viking Code School - http://www.vikingcodeschool.com/week-2-ruby/building-the-game-back-ends
# Author:         Matthew Davis ( Github: chewieee) && Paul H. Hyman (phyman.com | GitHub: phyman) 
# Copyright:      (C) Matthew Davis && Paul H. Hyman 2014 -
# Product:        CLI version of the Connect Four game written in Ruby

#!/usr/bin/ruby

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
				@p1_choice = @player_1.make_choice
				@p2_choice = @player_2.make_choice
				eval_winner(@p1_choice, @p2_choice)
				declare_winner
				if @winner
					exit
				end # if it's a tie play again!

			end # end loop do

		end # end game loop

		def eval_winner(player1, player2)
			case [player1, player2]

			when %w{ p r }, %w{ s p }, %w{ r s }
				@winner = 1  

			when %w{ r p }, %w{ p s }, %w{ s r }
				@winner = 2

			else
				@winner = nil
			end
		end

		def declare_winner
			puts "Player 1 chose #{@p1_choice} and Player 2 chose #{@p2_choice}"
			if @winner == nil
				puts "It was a tie!\n\n"
			else
				puts "The winner is Player #{@winner.to_s}!"
			end
		end

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
		
	def make_choice
		puts "Player #{@number} please choose (r)ock, (p)aper, (s)scissors"
		choice = gets.strip.downcase	
		if validate_choice(choice)
			return choice
		else
			puts "Please try again to select a valid choice\n\n"
			make_choice()
		end # if validate
	end	

	def validate_choice(choice)
		@@choices.include?(choice)
	end

end # Player

class AI < Player
	
		def make_choice
			return @@choices.sample
		end
end #AI


play






