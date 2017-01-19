# Tests for board class
# spec/board_spec.rb
require 'board'

# declare the named subject of our tests
describe Board do
  # let(:board){ Array.new(6){Array.new(7)} } 
  describe '#initialize' do
    subject(:board){ Board.new  }

    let(:test_array){ Array.new(2){Array.new(3)} }
    let(:test_board){ Board.new(test_array) }    

    it 'raises an ArgumentError with more than 1 argument' do
      expect{ Board.new(1,2)}.to raise_error(ArgumentError)
    end

    it 'does not raise an error passing in an array as input' do
      expect{ Board.new(Array.new(6){Array.new(7)})}.not_to raise_error
    end

    # testing outcomes in your public instance variables
    it 'saves your passed-in value as a public instance variable' do
      expect( test_board.board ).to eq(test_array)
    end
  end

  describe '#winning_horizontal' do
    it 'returns true for a winning_horizontal' do
      # board = Board.new(Array.new(6){Array.new(7)}
      board[0][0] = "r"
      board[1][0] = "r"
      board[2][0] = "r"
      board[3][0] = "r"
    end

    it 'returns false for a non winning_horizontal' do
      # board = Board.new(Array.new(6){Array.new(7)}
      board[0][0] = "r"
      board[1][0] = "r"
      board[2][0] = "r"
      board[3][0] = "y"
    end
  end

  describe '#winning_vertical' do
    it 'returns true for a winning_vertical' do
      # board = Board.new(Array.new(6){Array.new(7)}
      board[0][0] = "r"
      board[0][1] = "r"
      board[0][2] = "r"
      board[0][3] = "r"
    end

    it 'returns false for a non winning_vertical' do
      # board = Board.new(Array.new(6){Array.new(7)}
      board[0][0] = "r"
      board[0][1] = "y"
      board[0][2] = "r"
      board[0][3] = "r"
    end
  end

  describe '#winning_diagonal' do
    it 'returns true for a winning_diagonal' do
      # board = Board.new(Array.new(6){Array.new(7)}
      board[0][0] = "r"
      board[1][1] = "r"
      board[2][2] = "r"
      board[3][3] = "r"
    end

    it 'returns false for a non winning_diagonal' do
      # board = Board.new(Array.new(6){Array.new(7)}
      board[0][0] = "y"
      board[1][1] = "r"
      board[2][2] = "r"
      board[3][3] = "r"
    end
  end

  describe 'valid coordinates' do
    it 'returns true if the coordinates provided are valid'
      # board = Board.new(Array.new(6){Array.new(7)}
      expect( board.coordinates_available?(1,2) ).to be_truthy
    end
  end

  describe '#within_valid_coordinates?' do
    it 'returns true with valid coordinates' do
      expect(board.within_valid_coordinates(1,2)).to be_truthy
    end
  end
end
# it "sets player color" do

#   # Here we tell RSpec that the instance of
#   # `game` will have `gets` called inside it
#   # and we want that call to return "r"
#   # 
#   # Then our game can execute without stopping
#   # mid test for manual input
#   allow(game).to receive(:gets).and_return("r
  
