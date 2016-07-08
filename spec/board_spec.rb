require 'board'

describe Board do
  let(:board) { Board.new }

  describe "#initialize" do
    let(:board_grid) { board.instance_variable_get( :@board ) }

    it "creates an instance of board" do
      expect(board).to be_an_instance_of(Board)
    end

    it "creates a board with 7 columns" do
      col_count = board_grid.length
      expect(col_count).to eq(7)
    end

    it "when board is initialized, columns are empty" do

    end
  end
end