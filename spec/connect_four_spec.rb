require 'connect_four'

describe "Game Class" do

  let(:game_1_player){ Game.new(1) }
  let(:game_2_player){ Game.new(2) }

  describe "new game" do

    it "starts with an empty board" do
      expect(game_1_player.check_full_board).to be(false)
    end

  end

end
