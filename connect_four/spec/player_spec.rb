require 'player' 

describe Player do 

	let(:test_player) { Player.new('R') }

	describe "#initialize" do 

		it "assigns a color to the player" do
			expect(test_player.color).to eq('R')
		end

		# fails if it doesn't receive a color

	end

end