require 'player.rb'

class Game
	#welcome method , greets user etc.
	def initialize
		@humans = 0
		@plays = 0
	end

	def win(user_1_guess, user_2_guess)
		if user_1_guess==user_2_guess
			puts "TIE!!!"
		elsif [0,2].include?(user_1_guess) & [0,2].include?(user_2_guess)
			puts "Rock Beats Scissors"
			if user_1_guess<user_2_guess
				user_1.score+=1
			else
				user_2.score+=1
			end
		elsif user_1_guess>user_2_guess
			puts "#{user_1.guess} beats #{user_2.guess}!"
			user_1.guess+=1
		else
			puts "#{user_2.guess} beats #{user_1.guess}!"
			user_2.guess+=1
		end
	end



	def welcome
		puts "Welcome! Let's play 'Rock, Paper, Scissors!'"
	end
	#method number of human players
	def num_human
		p "How many humans will be playing?"
		@humans = gets.chomp.to_i
		until validate_humans(@humans) do #we still need a validate humans I think
			print "Invalid Selection! Please enter '1' or '2'"
		end
		puts "This will be a #{@humans}-player game."
	end

	def one_player_play
		user_1=Player.new("computer")
		user_2=Player.new("human")

	end

	def two_player_play
		user_1=Player.new("human")
		user_2=Player.new("human")
	end

	def play
		welcome
		num_human
		one_player_play if @humans=1
		two_player_play if @humans=2

	end

	def validate_human(human)
		[1,2].include?(human) ? true : false
	end

			#validate input
	#creating the game, 2 players,
			#def play
				#if 1 human player
						#generate two players, one human one computer
						#generate computer (random) guess
				#else 2 human player
						#generate two players, human
						#each player input guess
				#end
				#comparing method
				#output result
			#end	
end