require_relative "../lib/player.rb"
require_relative "../lib/board.rb"

describe Player do

	let(:board_double) { instance_double("Board")}
	let(:player) { Player.new("Test Player","X",board_double)}

	describe "#initialize" do
		it "has a name" do
			expect(player.name).to eq("Test Player")
		end

		it "has a piece" do
			expect(player.piece).to eq("X")
		end
	end

end