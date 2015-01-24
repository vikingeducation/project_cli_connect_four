class Player
	attr_accessor :role, :guess, :score
	@@guess_hash={rock: 0, paper: 1, scissors: 2}
	def initialize (role)
		@role = role
		@score=0
		set_guess
	end

	def set_guess
		@guess = rand(0..2) if @role == "computer"
		if @role == "human"
			puts  "Please enter your selection (rock, paper, scissors): "
			@guess=gets.chomp.to_sym
			until validate_guess(@guess) do
				puts "Invalid Selection! Guess must either be rock, paper or scissors"
			end
			@guess=@@guess_hash[@guess]

		end
	end

	def validate_guess(value)
		@@guess_hash.keys.include?(value) ? true : false
	end

end