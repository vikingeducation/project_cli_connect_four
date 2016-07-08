require 'connect_four'
require 'board'



describe Game do 
  let(:g){ Game.new(2) }
  let(:b){ Board.new}
  let(:win_horizontal) {[["B", "R"], ["B", "R"], ["B", "R"], ["B"], [], [], [], [1, 2, 3, 4, 5, 6], ["C", "E", "N", "N", "O", "C"], ["R", "U", "O", "F", "*", "T"]] }
  let(:bad_board) {
    [["B", "B", "R"],
    ["R", "R"],
    ["R"],
    ["R"],
    [],
    ["B", "B"],
    ["B"],
    [1, 2, 3, 4, 5, 6],
    ["C", "E", "N", "N", "O", "C"],
    ["R", "U", "O", "F", "*", "T"]]}

  describe "#win?" do
    it "correctly identifies a board with a winning horizontal row" do
      g.board.display_board = win_horizontal
      expect(g.win?).to eq(true)
    end

    it "doesn't count the first row as a different row" do
      g.board.display_board = bad_board
      expect(g.win?).to eq(false)
    end
  end

  describe "#board" do
    it "returns board data" do
      g.board = b
      expect(g.board).to_not be_nil
    end
  end

  describe "#horizontal_win?" do
    it "correctly identifies horizontal win" do
      g.board.display_board = win_horizontal
      expect(g.horizontal_win?).to eq(true)
    end
  end



end

