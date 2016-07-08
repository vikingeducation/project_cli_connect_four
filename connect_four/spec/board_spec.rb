require 'board'

describe Board do
  let(:board){Board.new}
  let(:horizontal_win_board){ Board.new( Array.new(7){["X"]} ) }
  let(:vertical_win_board){ Board.new( [ ["O","O","O","O"],[], [], [], [], [], [] ] ) }
  let(:diaganol_win_board) do 
    Board.new( [ ["O"], ["X", "O"], ["X","X","O"], ["X", "O", "X", "O"],[],[],[] ] ) 
  end
  let(:full_board) do
    Board.new([%w[O X X O O O],%w[X O O X X O],%w[X X O X O X], %w[X O X X X O],%w[O O X O O X],%w[X X O O X O],%w[O O X X O X]])
  end

  describe '#initialize' do 
    it "creates an empty grid" do
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
      expect(diaganol_win_board.game_over?).to be true
    end

    it "should return true if the board is full" do
      expect(full_board.game_over?).to be true
    end

  end

end