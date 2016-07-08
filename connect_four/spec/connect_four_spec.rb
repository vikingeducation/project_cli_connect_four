require 'connect_four'
require 'board'



describe Game do 
  let(:g){ Game.new(2) }
  let(:b){ Board.new}
  let(:win_horizontal) {
    [["B"],["B"],["B"],["B"]] }

  describe "#horizontal_win?" do
    it "correctly identifies a board with a winning horizontal row" do
      g.board.display_board = win_horizontal
      expect(g.win?).to eq(true)
    end
  end

  describe "#board" do
    it "returns board data" do
      g.board = b
    expect(g.board).to_not be_nil
    end
  end



end

