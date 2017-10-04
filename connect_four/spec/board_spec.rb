require "board"

describe Board do 
  let(:board) { Board.new }

  describe "#initialize" do 
    it "initializes @board a blank board with numbered columns" do 
      test_array = [['1', '2', '3', '4', '5', '6', '7'],
                    ['-', '-', '-', '-', '-', '-', '-'],
                    ['-', '-', '-', '-', '-', '-', '-'],
                    ['-', '-', '-', '-', '-', '-', '-'],
                    ['-', '-', '-', '-', '-', '-', '-'],
                    ['-', '-', '-', '-', '-', '-', '-'],
                    ['-', '-', '-', '-', '-', '-', '-']]
      expect(board.board).to eql(test_array)
    end

    it "initializes @diagonals to an empty array" do 
      test_array = []
      expect(board.diagonals).to eql([])
    end
  end

  describe "#win_horizontal" do 
    context "four of the same game piece in a row on the board" do 
      it "returns true" do 
        current_player_piece = "R"
        board.board = [['1', '2', '3', '4', '5', '6', '7'],
                      ['-', '-', '-', '-', '-', '-', '-'],
                      ['-', '-', '-', '-', '-', '-', '-'],
                      ['-', '-', '-', '-', '-', '-', '-'],
                      ['-', '-', '-', '-', '-', '-', '-'],
                      ['-', '-', 'R', 'R', 'R', 'R', '-'],
                      ['-', '-', '-', '-', '-', '-', '-']] 
        expect(board.win_horizontal?(current_player_piece)).to be_truthy
      end
    end
  end
end