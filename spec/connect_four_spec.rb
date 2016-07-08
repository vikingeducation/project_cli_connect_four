require "./lib/connect_four.rb"

describe ConnectFour do

  let(:board){Board.new}
  let(:player){Human.new("Leo", "R", board)}
  let(:game){ConnectFour.new(board)}

  let(:board_horizontal){Board.new([[Piece.new("R"), [], [], [], [], []],
 [Piece.new("R"), [], [], [], [], []],
 [Piece.new("R"), [], [], [], [], []],
 [Piece.new("R"), [], [], [], [], []],
 [[], [], [], [], [], []],
 [[], [], [], [], [], []],
 [[], [], [], [], [], []]])}

  let(:game_horizontal){ConnectFour.new(board_horizontal)}


  let(:board_vertical){Board.new([[Piece.new("R"), Piece.new("R"), Piece.new("R"), Piece.new("R"), [], []],
 [[], [], [], [], [], []],
 [[], [], [], [], [], []],
 [[], [], [], [], [], []],
 [[], [], [], [], [], []],
 [[], [], [], [], [], []],
 [[], [], [], [], [], []]])}

  let(:game_vertical){ConnectFour.new(board_vertical)}

  let(:board_rising_diagonal){Board.new([[Piece.new("R"), [], [], [], [], []],
 [[], Piece.new("R"), [], [], [], []],
 [[], [], Piece.new("R"), [], [], []],
 [[], [], [], Piece.new("R"), [], []],
 [[], [], [], [], [], []],
 [[], [], [], [], [], []],
 [[], [], [], [], [], []]])}

  let(:game_rd){ConnectFour.new(board_rising_diagonal)}

  let(:board_falling_diagonal){Board.new([[[], [], [], Piece.new("R"), [], []],
 [[], [], Piece.new("R"), [], [], []],
 [[], Piece.new("R"), [], [], [], []],
 [Piece.new("R"), [], [], [], [], []],
 [[], [], [], [], [], []],
 [[], [], [], [], [], []],
 [[], [], [], [], [], []]])}

  let(:game_fd){ConnectFour.new(board_falling_diagonal)}


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
      expect(game.win?).to be false
    end
    it "returns true on a horizontal win" do
      expect(game_horizontal.win?).to be true
    end
    it "returns true on a vertical win" do
      expect(game_vertical.win?).to be true
    end
    it "returns true on a rising diagonal win" do
      expect(game_rd.win?).to be true
    end
    it "returns true on a falling diagonal win" do
      expect(game_fd.win?).to be true
    end
  end

  describe "#full_board?"
    it "returns false on empty" do
      expect(game.full_board?).to be false
    end
    it "returns false on partial board" do
      expect(game_horizontal.full_board?).to be false
    end

end
