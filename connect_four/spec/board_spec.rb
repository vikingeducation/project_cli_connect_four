load 'lib/board.rb'

=begin
  initialize
  add_piece
=end

describe 'Board' do
  let(:b){ Board.new }
  let(:test_board){[["o"," "," "," "," "," "," "],
                   ["o"," "," "," "," "," "," "],
                   ["o"," "," "," "," "," "," "],
                   ["o"," "," "," "," "," "," "],
                   ["o"," "," "," "," "," "," "],
                   ["o","o","o","o","o","o","o"]]}

  describe '#get_row' do
    it 'will return the first empty row given a column' do
      expect(b.get_row([1,2,3])).to eq(2)
    end
  end

  describe '#valid_drop?' do
    it 'will tell you a column is full' do
      expect(Board.new(test_board).valid_drop?(1)).to be(false)
    end

    it 'will tell you you are out of bounds' do
      expect(b.in_bounds?(12)).to be(false)
    end

    it 'will tell you you are in bounds' do
      expect(b.in_bounds?(3)).to be(true)
    end
  end



end
