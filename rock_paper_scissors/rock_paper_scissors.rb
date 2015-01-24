class Game
	#welcome method , greets user etc.
	def initialize
		@humans = 0
		@plays = 0
	end

	def welcome
		puts "Welcome! Let's play 'Rock, Paper, Scissors!'"
	end
	#method number of human players
	def num_human
		p "How many humans will be playing?"
		@humans = gets.chomp.to_i
		until validate_humans do #we still need a validate humans I think
			print "Invalid Selection! Please enter '1' or '2'"
		end
		puts "This will be a #{@humans}-player game."
	end

	def play
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

class Player
	attr_accessor :role, :guess
	@@guess_hash={:rock=0, :paper=1, :scissors=2}
	def initialize (role)
		@role = role
		if @role=="human"
			# have user set guess
		elsif @role=="computer"
			# randomly generate guess
			@guess=rand(0..2)
		end
	end

	def set_guess
		if @role == "computer"
			@guess = rand(0..2)
		elsif @role == "human"
			puts  "Please enter your selection (rock, paper, scissors): "
			@guess=gets.chomp
			until validate_guess(@guess)
				puts "Invalid Selection! Guess must either be rock, paper or scissors"
			end
		end
	end

	def validate_guess(value)
		@@guess_hash.keys.include?(value) ? true : false
	end

end