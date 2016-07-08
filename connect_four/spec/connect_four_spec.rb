require 'connect_four'
require 'board'



describe Game do 
  let(:g){ Game.new(1) }
  let(:b){ Board.new}
  let(:win_horizontal) {[
    ["B"],
    ["B"],
    ["B"],
    ["B"],
    [],
    [],
    [],
    [1,2,3,4,5,6],
    ["C","E","N","N","O","C"],
    ["R","U","O","F","*","T"]] }

  describe "#win?" do
    it "correctly identifies a board with a winning horizontal row" do
      g.display_board = win_horizontal
      expect(g.win?).to eq(true)
    end
  end

end

