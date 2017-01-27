# Tests for board class
# spec/board_spec.rb
require 'board'
include Connect_Four

# declare the named subject of our tests
describe Board do
  let(:board){ Board.new(Array.new(6){Array.new(7)})  }
  let(:test_array){ Array.new(2){Array.new(3)} }
  let(:test_board){ Board.new(test_array) }  

  describe '#initialize' do
    it 'raises an ArgumentError with more than 1 argument' do
      expect{ Board.new(1,2)}.to raise_error(ArgumentError)
    end

    it 'does not raise an error passing in an array as input' do
      expect{ Board.new(Array.new(6){Array.new(7)})}.not_to raise_error
    end

    it 'saves your passed-in value as a public instance variable' do
      expect( test_board.board).to eq(test_array)
    end
  end

  describe '#winning_vertical' do
    it 'returns true for a winning_vertical' do
      red_board = [[:r, "", "", "","", "",""],
                   [:r, "", "", "","", "",""],
                   [:r, "", "", "","", "",""],
                   [:r, "", "", "","", "",""],
                   ["", "", "", "","", "",""],
                   ["", "", "", "","", "",""],
                   ["", "", "", "","", "",""]]
      expect(Board.new(red_board).winning_vertical?(:r)).to be_truthy
    end

    it 'returns false for a non winning_vertical' do
      expect(board.winning_vertical?(:y)).to be_falsey
    end
  end

  describe '#winning_horizontal' do
    it 'returns true for a winning_horizontal' do
      red_board = [[:r, :r, :r, :r,"", "",""],
                   ["", "", "", "","", "",""],
                   ["", "", "", "","", "",""],
                   ["", "", "", "","", "",""],
                   ["", "", "", "","", "",""],
                   ["", "", "", "","", "",""],
                   ["", "", "", "","", "",""]]
      expect(Board.new(red_board).winning_horizontal?(:r)).to be_truthy
    end

    it 'returns false for a non winning_vertical' do
      non_winning_board = [[:r, :y, :r, :r,"", "",""],
                   ["", "", "", "","", "",""],
                   ["", "", "", "","", "",""],
                   ["", "", "", "","", "",""],
                   ["", "", "", "","", "",""],
                   ["", "", "", "","", "",""],
                   ["", "", "", "","", "",""]]
      expect(Board.new(non_winning_board).winning_horizontal?(:r)).to be_falsey
    end
  end

  describe '#winning_diagonal' do
    it 'returns true for a winning_diagonal' do
      red_board = [[:r, "", "", "","", "",""],
                   ["", :r, "", "","", "",""],
                   ["", "", :r, "","", "",""],
                   ["", "", "", :r,"", "",""],
                   ["", "", "", "","", "",""],
                   ["", "", "", "","", "",""],
                   ["", "", "", "","", "",""]]
      expect(Board.new(red_board).winning_diagonal?(:r)).to be_truthy
    end

    it 'returns true for a winning_diagonal with mixed input' do
      win_red_board = [[:y, "", "", "","", "",""],
                   ["", :y, "", "",:y, "",""],
                   [:r, "", :y, "","", "",""],
                   [:y, :r, "", :y,"", "",""],
                   ["", :r, :r, "",:r, "",""],
                   ["", :r, "", :r,"", :r,""],
                   ["", "", "", "",:y, :r,:r]]
      expect(Board.new(win_red_board).winning_diagonal?(:r)).to be_truthy
    end

    it 'returns false for a non winning_diagonal' do
      lose_red_board = [[:y, "", "", "","", "",""],
                   ["", :y, "", "",:y, "",""],
                   [:r, "", :y, "","", "",""],
                   [:y, :y, "", :y,"", "",""],
                   ["", :r, :r, "",:r, "",""],
                   ["", :r, "", :r,"", :r,""],
                   ["", "", "", "",:y, :r,:r]]
      expect(Board.new(lose_red_board).winning_diagonal?(:r)).to be_falsey
    end
  end

  # describe 'valid coordinates' do
  #   xit 'returns true if the coordinates provided are valid'
  #     # board = Board.new(Array.new(6){Array.new(7)}
  #     expect( board.coordinates_available?(1,2) ).to be_truthy
  #   end
  # end

  # describe '#within_valid_coordinates?' do
  #   xit 'returns true with valid coordinates' do
  #     expect(board.within_valid_coordinates(1,2)).to be_truthy
  #   end
  # end
end