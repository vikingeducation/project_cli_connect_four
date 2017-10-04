require 'game'

describe Game do 
  let(:game) { Game.new }

  describe "#initialize" do 
    context "argument given" do 
      it "raises an error" do 
        expect{ Game.new("thing") }.to raise_error(ArgumentError)
      end
    end
  end

  describe "#create_players" do 
    context "game type = 1" do 
      it "intializes player_1 as a HumanPlayer and player_2 as a ComputerPlayer" do 
        game_type = 1
        game.create_players
        expect(game.player_1).to be_an_instance_of(HumanPlayer)
      end
    end
  end
end