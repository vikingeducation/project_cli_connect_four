load 'lib/board.rb'

=begin
  initialize
  add_piece
=end

describe 'Board' do
  let(:b){ Board.new }
  let(:test_board){["o"," "," "," "," "," "," "], 
                   ["o"," "," "," "," "," "," "],
                   ["o"," "," "," "," "," "," "],
                   ["o"," "," "," "," "," "," "],
                   ["o"," "," "," "," "," "," "],
                   ["o","o","o","o","o","o","o"]}

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

  describe '#valid_drop?' do
    it 'will tell you a column is full' do
      expect(Board.new(test_board))
    end

    # it 'will tell you you are out of bounds'

    # it 'will accept your column'
  end

end
