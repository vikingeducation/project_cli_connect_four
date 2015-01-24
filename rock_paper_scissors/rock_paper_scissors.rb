# Your code here!

class player
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
			validate_guess
	end

	def validate_guess(value)
		while !@@guess_hash.keys.include?()

	end

end