require 'computer_player'
require 'board'

describe ComputerPlayer do 

  let(:player) { ComputerPlayer.new }
  let(:board) {Board.new}

  describe "#almost_win_horizontal?" do 
    context "there is a row on the board with three computer game pieces in consecutive postitions" do 
      it "returns the index of the column that would result in a win + 1" do 
        board = [['1', '2', '3', '4', '5', '6', '7'],
                 ['-', '-', '-', '-', '-', '-', '-'],
                 ['-', '-', '-', '-', '-', '-', '-'],
                 ['-', '-', '-', '-', '-', '-', '-'],
                 ['-', '-', '-', '-', '-', '-', '-'],
                 ['-', '-', '-', 'B', 'B', 'B', '-'],
                 ['-', '-', '-', '-', '-', '-', '-']]
        current_player_piece = "B"
        expect(player.almost_win_horizontal?(current_player_piece, board)).to eql(3)
      end
    end

    context "there is a row on the board with 4-space unit containing 3 non-consecutive computer game pieces" do 
      it "returns the index of the column that would result in a win + 1" do 
        board = [['1', '2', '3', '4', '5', '6', '7'],
                 ['-', '-', '-', '-', '-', '-', '-'],
                 ['-', '-', '-', '-', '-', '-', '-'],
                 ['-', '-', '-', '-', '-', '-', '-'],
                 ['-', '-', '-', '-', '-', '-', '-'],
                 ['-', '-', 'B', '-', 'B', 'B', '-'],
                 ['-', '-', '-', '-', '-', '-', '-']]
        current_player_piece = "B"
        expect(player.almost_win_horizontal?(current_player_piece, board)).to eql(4)
      end
    end
  end

  describe "#almost_win_diagonal?" do 
    context "there is a diagonal on the board with three computer game pieces in consecutive postitions" do 
      it "returns the index of the column that would result in a win + 1" do 
        board.board = [['1', '2', '3', '4', '5', '6', '7'],
                       ['-', '-', '-', '-', '-', '-', '-'],
                       ['-', '-', '-', '-', '-', '-', '-'],
                       ['-', '-', '-', '-', '-', 'B', '-'],
                       ['-', '-', '-', '-', 'B', '-', '-'],
                       ['-', '-', '-', 'B', '-', '-', '-'],
                       ['-', '-', '-', '-', '-', '-', '-']]
        current_player_piece = "B"
        board.set_diagonals
        expect(player.almost_win_diagonal?(current_player_piece, board.diagonals, board.board)).to eql(3)
      end

      it "returns the index of the column that would result in a win + 1" do 
        board.board = [['1', '2', '3', '4', '5', '6', '7'],
                       ['-', '-', '-', '-', '-', '-', '-'],
                       ['-', '-', '-', '-', '-', '-', '-'],
                       ['-', '-', '-', '-', '-', '-', '-'],
                       ['-', '-', '-', '-', 'B', 'R', '-'],
                       ['-', '-', '-', 'B', '-', 'R', '-'],
                       ['-', '-', 'B', '-', '-', 'R', '-']]
        current_player_piece = "B"
        board.set_diagonals
        expect(player.almost_win_diagonal?(current_player_piece, board.diagonals, board.board)).to eql(6)
      end

      context "there is a diagonal on the board with three computer game pieces in consecutive postitions, but the winning move 
                is not available" do
        it "returns false" do 
          board.board = [['1', '2', '3', '4', '5', '6', '7'],
                         ['-', '-', '-', '-', '-', '-', '-'],
                         ['-', '-', '-', '-', '-', '-', '-'],
                         ['-', '-', '-', '-', '-', '-', '-'],
                         ['-', '-', '-', '-', 'B', '-', '-'],
                         ['-', '-', '-', 'B', '-', '-', '-'],
                         ['-', '-', 'B', '-', '-', 'R', '-']]
          current_player_piece = "B"
          board.set_diagonals
          expect(player.almost_win_diagonal?(current_player_piece, board.diagonals, board.board)).to be false
        end
      end

      context "there is a diagonal on the board with three computer game pieces in proper postition, and one missing
              and the winning move is available" do
        it "returns the index of the column that would result in a win + 1" do 
          board.board = [['1', '2', '3', '4', '5', '6', '7'],
                         ['-', '-', '-', '-', '-', '-', '-'],
                         ['-', '-', '-', '-', '-', '-', '-'],
                         ['-', '-', '-', '-', '-', 'B', '-'],
                         ['-', '-', '-', '-', '-', '-', '-'],
                         ['-', '-', '-', 'B', 'R', '-', '-'],
                         ['-', '-', 'B', '-', 'R', '-', '-']]
          current_player_piece = "B"
          board.set_diagonals
          expect(player.almost_win_diagonal?(current_player_piece, board.diagonals, board.board)).to eql(5)
        end
      end

       context "there is a diagonal on the board with fewer than three computer game pieces in proper postition" do
        it "returns the index of the column that would result in a win + 1" do 
          board.board = [['1', '2', '3', '4', '5', '6', '7'],
                         ['-', '-', '-', '-', '-', '-', '-'],
                         ['-', '-', '-', '-', '-', '-', '-'],
                         ['-', '-', '-', '-', '-', '-', '-'],
                         ['-', '-', '-', '-', '-', '-', '-'],
                         ['-', '-', '-', 'B', '-', '-', '-'],
                         ['-', '-', 'B', '-', '-', '-', '-']]
          current_player_piece = "B"
          board.set_diagonals
          expect(player.almost_win_diagonal?(current_player_piece, board.diagonals, board.board)).to be false
        end
      end
    end

    describe "#almost_win_vertical?" do 
      context "there is a column on the board with three computer game pieces in consecutive postitions" do 
        it "returns the index of the column that would result in a win + 1" do 
          board = [['1', '2', '3', '4', '5', '6', '7'],
                   ['-', '-', '-', '-', '-', '-', '-'],
                   ['-', '-', '-', '-', '-', '-', '-'],
                   ['-', '-', '-', '-', '-', '-', '-'],
                   ['-', '-', '-', '-', '-', 'B', '-'],
                   ['-', '-', '-', '-', '-', 'B', '-'],
                   ['-', '-', '-', '-', '-', 'B', '-']]
          current_player_piece = "B"
          expect(player.almost_win_vertical?(current_player_piece, board)).to eql(6)
        end
      end

      context "there is a column on the board with fewer than three computer game pieces in consecutive postitions" do 
        it "returns the index of the column that would result in a win + 1" do 
          board = [['1', '2', '3', '4', '5', '6', '7'],
                   ['-', '-', '-', '-', '-', '-', '-'],
                   ['-', '-', '-', '-', '-', '-', '-'],
                   ['-', '-', '-', '-', '-', '-', '-'],
                   ['-', '-', '-', '-', '-', '-', '-'],
                   ['-', '-', '-', '-', '-', 'B', '-'],
                   ['-', '-', '-', '-', '-', 'B', '-']]
          current_player_piece = "B"
          expect(player.almost_win_vertical?(current_player_piece, board)).to be false
        end
      end
    end
  end
end 