require 'board'

describe Board do
  let(:board){Board.new}

  describe '#grid' do
    it "returns the grid" do
      expect(board.grid).to eq(Array.new(7){[]})
    end
  end

end