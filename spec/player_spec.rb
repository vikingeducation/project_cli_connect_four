require './connect_four/player.rb'
require './connect_four/board.rb'

describe Player do

  let(:board){ Board.new }
  let(:p1){ Player.new("Bran", :X, board) }

  describe '#initialize' do
    it 'has a name' do
      expect(p1.name).to eq('Bran')
    end
    it 'raise an error when the piece is not a symbol' do
      expect{ Player.new("Bran", 'X', board) }.to raise_error("Piece must be a Symbol!")
    end
  end

  describe '#get_coordinates' do
    it 'add a piece into the board' do
      allow(p1).to receive(:gets).and_return("1, 2")
      p1.get_coordinates
      result = board.add_piece([1, 2], :X)
      expect(result).to be_falsy
    end
  end

end
