# Tests for board class
# spec/board_spec.rb
require 'board'

describe Board do
  # let(:board){ Array.new(6){Array.new(7)} } 

  describe '#initialize' do
    it 'raises an ArgumentError with more than 1 argument' do
      expect{ Board.new(1,2)}.to raise_error(ArgumentError)
    end

    it 'does not raise an error passing in an array as input' do
      expect{ Board.new(Array.new(6){Array.new(7)})}.not_to raise_error
    end
  end

  # testing outcomes in your public instance variables
  it 'saves your passed-in value as a public instance variable' do
    test_array = Array.new(2){Array.new(3)} 
    test_board = Board.new(test_array)
    expect( test_board.board ).to eq(test_array)
  end

  
  # describe '#within_valid_coordinates?' do
  #   it 'returns true with valid coordinates' do
  #     expect(board.within_valid_coordinates(1,2)).to be_truthy
  #   end
  # end
end