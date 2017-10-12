require "board"

describe Board do 
  let(:board) { Board.new }

  describe "#initialize" do 
    it "initializes @board to a blank board with numbered columns" do 
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

  describe "#win_horizontal?" do 
    let(:current_player_piece) { 'R' }
    context "four of the same game piece occupy conesecutive spaces in a row on the board" do 
      it "returns true" do 
        board.board = [['1', '2', '3', '4', '5', '6', '7'],
                      ['-', '-', '-', '-', '-', '-', '-'],
                      ['-', '-', '-', '-', '-', '-', '-'],
                      ['-', '-', '-', '-', '-', '-', '-'],
                      ['-', '-', '-', '-', '-', '-', '-'],
                      ['-', '-', 'R', 'R', 'R', 'R', '-'],
                      ['-', '-', '-', '-', '-', '-', '-']] 
        expect(board.win_horizontal?(current_player_piece)).to be true
      end
    end

    context "fewer than four of the same game piece occupy conesecutive spaces in a row on the board" do 
      it "returns false" do 
        board.board = [['1', '2', '3', '4', '5', '6', '7'],
                      ['-', '-', '-', '-', '-', '-', '-'],
                      ['-', '-', '-', '-', '-', '-', '-'],
                      ['-', '-', '-', '-', '-', '-', '-'],
                      ['-', '-', '-', '-', '-', '-', '-'],
                      ['-', '-', '-', 'R', 'R', 'R', '-'],
                      ['-', '-', '-', '-', '-', '-', '-']] 
        expect(board.win_horizontal?(current_player_piece)).to be false
      end
    end
  end

  describe "#win_vertical?" do 
    let(:current_player_piece) { 'R' }
    context "four of the same game piece occupy conesecutive spaces in a column on the board" do 
      it "returns true" do 
        board.board = [['1', '2', '3', '4', '5', '6', '7'],
                      ['-', '-', '-', '-', '-', '-', '-'],
                      ['-', '-', '-', '-', '-', 'R', '-'],
                      ['-', '-', '-', '-', '-', 'R', '-'],
                      ['-', '-', '-', '-', '-', 'R', '-'],
                      ['-', '-', '-', '-', '-', 'R', '-'],
                      ['-', '-', '-', '-', '-', '-', '-']] 
        expect(board.win_vertical?(current_player_piece)).to be true
      end
    end

    context "fewer than four of the same game piece occupy conesecutive spaces in a column on the board" do 
      it "returns false" do 
        board.board = [['1', '2', '3', '4', '5', '6', '7'],
                      ['-', '-', '-', '-', '-', '-', '-'],
                      ['-', '-', '-', '-', '-', '-', '-'],
                      ['-', '-', '-', '-', '-', '-', '-'],
                      ['-', '-', '-', '-', '-', 'R', '-'],
                      ['-', '-', '-', '-', '-', 'R', '-'],
                      ['-', '-', '-', '-', '-', '-', '-']] 
        expect(board.win_vertical?(current_player_piece)).to be false
      end
    end
  end

    describe "#win_diagonal?" do 
    let(:current_player_piece) { 'R' }
    context "four of the same game piece occupy conesecutive spaces in a diagonal on the board" do 
      it "returns true" do 
        board.board = [['1', '2', '3', '4', '5', '6', '7'],
                      ['-', '-', '-', '-', '-', '-', '-'],
                      ['-', '-', 'R', '-', '-', '-', '-'],
                      ['-', '-', '-', 'R', '-', '-', '-'],
                      ['-', '-', '-', '-', 'R', '-', '-'],
                      ['-', '-', '-', '-', '-', 'R', '-'],
                      ['-', '-', '-', '-', '-', '-', '-']]
        board.set_diagonals 
        expect(board.win_diagonal?(current_player_piece)).to be true
      end
    end

    it "returns true" do 
      board.board = [['1', '2', '3', '4', '5', '6', '7'],
                    ['-', '-', '-', '-', '-', '-', '-'],
                    ['-', '-', '-', '-', 'R', '-', '-'],
                    ['-', '-', '-', 'R', '-', '-', '-'],
                    ['-', '-', 'R', '-', '-', '-', '-'],
                    ['-', 'R', '-', '-', '-', '-', '-'],
                    ['-', '-', '-', '-', '-', '-', '-']]
      board.set_diagonals 
      expect(board.win_diagonal?(current_player_piece)).to be true
    end

    context "fewer than four of the same game piece occupy conesecutive spaces in a diagonal on the board" do 
      it "returns false" do 
        board.board = [['1', '2', '3', '4', '5', '6', '7'],
                      ['-', '-', '-', '-', '-', '-', '-'],
                      ['-', '-', '-', '-', '-', '-', '-'],
                      ['-', '-', '-', 'R', '-', '-', '-'],
                      ['-', '-', '-', '-', 'R', '-', '-'],
                      ['-', '-', '-', '-', '-', 'R', '-'],
                      ['-', '-', '-', '-', '-', '-', '-']]
        board.set_diagonals  
        expect(board.win_diagonal?(current_player_piece)).to be false
      end
    end
  end

  describe "#full?" do 
    context "Board is full" do 
      it "returns true" do 
        board.board = [['1', '2', '3', '4', '5', '6', '7'],
                      ['R', 'R', 'R', 'R', 'R', 'R', 'R'],
                      ['R', 'R', 'R', 'R', 'R', 'R', 'R'],
                      ['R', 'R', 'R', 'R', 'R', 'R', 'R'],
                      ['R', 'R', 'R', 'R', 'R', 'R', 'R'],
                      ['R', 'R', 'R', 'R', 'R', 'R', 'R'],
                      ['R', 'R', 'R', 'R', 'R', 'R', 'R']]
        expect(board.full?).to be true
      end
    end

    context "Board is not full" do
      it "returns false" do
        board.board = [['1', '2', '3', '4', '5', '6', '7'],
                      ['-', 'R', 'R', 'R', 'R', 'R', 'R'],
                      ['R', 'R', 'R', 'R', 'R', 'R', 'R'],
                      ['R', 'R', 'R', 'R', 'R', 'R', 'R'],
                      ['R', 'R', 'R', 'R', 'R', 'R', 'R'],
                      ['R', 'R', 'R', 'R', 'R', 'R', 'R'],
                      ['R', 'R', 'R', 'R', 'R', 'R', 'R']]
        expect(board.full?).to be false
      end
    end
  end

  describe "#update_board" do 
    let(:current_player_piece) { 'R' }
    context "Board is empty" do 
      it "returns 6" do 
        column = 6
        expect(board.update_board(column, current_player_piece)).to eql(6)
      end
    end

    context "Bottom two rows of specified column are occupied." do 
      it "returns 4" do 
        column = 6
        board.board = [['1', '2', '3', '4', '5', '6', '7'],
                       ['-', '-', '-', '-', '-', '-', '-'],
                       ['-', '-', '-', '-', '-', '-', '-'],
                       ['-', '-', '-', '-', '-', '-', '-'],
                       ['-', '-', '-', '-', '-', '-', '-'],
                       ['-', '-', '-', '-', '-', 'R', '-'],
                       ['-', '-', '-', '-', '-', 'R', '-']]
        expect(board.update_board(column, current_player_piece)).to eql(4)
      end
    end
  end

  describe "#set_diagonals" do 
    it "updates the values of @diagonals after the board is updated" do 
      board.board = [['1', '2', '3', '4', '5', '6', '7'],
                       ['-', '-', '-', '-', '-', '-', '-'],
                       ['-', '-', '-', '-', '-', '-', '-'],
                       ['-', '-', '-', '-', '-', '-', '-'],
                       ['-', '-', '-', '-', '-', '-', '-'],
                       ['-', '-', '-', '-', 'R', '-', '-'],
                       ['-', '-', '-', '-', '-', 'R', '-']]
      board.set_diagonals
      expect(board.diagonals[2]).to eql(['-', '-', '-', '-', 'R', 'R'])
    end
  end
end