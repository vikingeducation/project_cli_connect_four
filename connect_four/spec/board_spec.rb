load 'lib/board.rb'

=begin
  initialize
  add_piece
=end

describe 'Board' do
  let(:b){ Board.new }
  describe '#initialize' do
    it 'raises an error when arguments are passed to initialize' do
      expect do
        Board.new(1)
      end.to raise_error(ArgumentError)
    end
  end
  describe '#get_row' do
    it 'will return the first empty row given a column' do
      expect(b.get_row([1,2,3])).to eq(2)
    end
  end

end
