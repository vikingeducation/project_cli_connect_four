require 'player' 

describe Player do 

	let(:test_player) { Player.new('R') }

	describe "#initialize" do 

		it "assigns a color to the player" do
			expect(test_player.color).to eq('R')
		end

	end

end