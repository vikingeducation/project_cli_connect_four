# Your code here!
class RockPaperScissor

	CHOICES = ["rock", "paper", "scissors"]

	def initialize
			@victory = {:scissors => :rock, :rock => :paper, :paper => :scissors }
	end

	def play
		get_choice
		loop do
			if is_valid?(@player_choice)
				computer_chooses
				check_win(@player_choice, @comp_choice)
				break
			else
				puts "your choice was invalid, try again"
			end
		end
	end

	def get_choice
		puts "Choose rock, paper, or scissors."
		@player_choice = gets.strip.downcase
	end

	def is_valid?(choice)
		CHOICES.include?(choice)
	end

	def check_win(choice1, choice2)
		if choice1 == choice2
			puts "This is a draw"
		elsif @victory[choice1] == choice2
			puts "computer wins"
		else
			puts "player wins"
		end
	end

	def computer_chooses
		@comp_choice = CHOICES[rand(0..2)]
		puts "Computer chooses #{@comp_choice}"
	end

end

t = RockPaperScissor.new
t.play


