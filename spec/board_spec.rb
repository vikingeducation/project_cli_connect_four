require 'board'

describe Board do
  let(:board) { Board.new }
  let(:board_grid) { board.instance_variable_get( :@board ) }     

  describe "#initialize" do

    it "creates an instance of board" do
      expect(board).to be_an_instance_of(Board)
    end

    it "creates a board with 7 columns" do
      col_count = board_grid.length
      expect(col_count).to eq(7)
    end

    it "when board is initialized, columns are empty" do
      expect(board_grid.all?(&:empty?)).to eq(true)
    end
  end

  describe "#add_piece" do
    before(:each) do
      board.add_piece('r',0)
    end


    it "adds the correct color piece in the correct spot" do
      expect(board_grid.first[0]).to eq('r')
    end

    it "only adds to the correct spot" do
      board_size = board_grid.reduce(0) do |piece_total,col|
        piece_total + col.length
      end
      expect(board_size).to eq(1)
    end

    #only adds to the correct spot
    #col must be available
  end
end