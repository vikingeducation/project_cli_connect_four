require_relative "../lib/player.rb"

describe Player do
    it "is a player" do
		expect(subject).to be_a(Player)
	end
end