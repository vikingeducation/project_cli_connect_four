require_relative '../lib/game'

describe Game do
  
  let(:game){ Game.new }

  describe "#initialize" do
  	it "creates new game object" do
  	  expect(game).to be_a(Game)
  	end
  end
end