require 'board'

describe Board do
  let(:board){Board.new}
  let(:horizontal_win_board){ Board.new( Array.new(7){["X"]} ) }
  let(:vertical_win_board){ Board.new( [ ["O","O","O","O"],[], [], [], [], [], [] ] ) }
  let(:diaganol_win_board) do 
    Board.new( [ ["O"], ["X", "O"], ["X","X","O"], ["X", "O", "X", "O"],[],[],[] ] ) 
  end

  describe '#grid' do
    it "returns the grid" do
      expect(board.grid).to eq(Array.new(7){[]})
    end
  end

  describe "#move" do 
    
    it "should have a piece in the appropriate column" do 
      board.move(2, "X")
      expect(board.grid[1].last).to eq("X")
    end
  end

  describe "#victory" do 
    it "should return false for an empty grid" do
      expect(board.victory?).to be false
    end

    it "should return true for four in a row horizontally" do 
      expect(horizontal_win_board.victory?).to be true
    end

    it "should return true for four in a row vertically" do 
      expect(vertical_win_board.victory?).to be true
    end

    it "should return true for four in a row diaganolly" do 
      expect(diaganol_win_board.victory?).to be true
    end
  end

  describe "#game_over?" do 
    it "should return true if a player has won the game" do 

    end

  end

end