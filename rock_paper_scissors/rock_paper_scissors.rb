# Your code here!
class RockPaperScissor

	def initialize
			@gamer = AI.new
			@choice
			@options = {:scissors => :rock, :rock => :paper, :paper => :scissors }

	end

	def play
		loop do
			@choice.get_choice
			@choice.is_valid?
			break if check_win
			end
	end

	def get_choice
		puts "Choose rock, paper or scissors."
		@choice = gets.strip.downcase
	end

	def is_valid?
		
	end

	def check_win

	end 

end

class AI
	#generates a move
end

class Player
end

t = RockPaperScissor
t.play

puts "enter 1 for single player. Enter 2 for multi-player"


