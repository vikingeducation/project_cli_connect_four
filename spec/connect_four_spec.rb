require "./lib/connect_four.rb"

describe ConnectFour do

  let(:game){ConnectFour.new}
  let(:board){Board.new}
  let(:player){Human.new("Leo", "R", board)}


  describe "#initialize" do
    it "creates a new ConnectFour object" do
      expect(game).to be_a(ConnectFour)
    end
  end

  describe "get_players_names" do
    it "returns an array of both player names" do
        allow(game).to receive(:gets).and_return("Tom", "Harry")
        expect(game.get_players_names).to eq(["Tom", "Harry"])
    end
  end

  describe "#player_moves" do
    it "passes argument to player.make_move" do
      allow(player).to receive(:gets).and_return("1")
      game.player_moves(player)
      expect(board.verticals[0][0]).to be_a(Piece)
    end
  end

  describe "#win?" do
    it "returns false on an empty board" do
      expect(game.win?).to eq(false)
    end

  end

end
