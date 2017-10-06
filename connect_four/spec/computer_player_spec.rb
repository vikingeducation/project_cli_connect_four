require 'computer_player'

describe ComputerPlayer do 

  let(:player) { ComputerPlayer.new }

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
    context "there is a row on the board with three computer game pieces in consecutive postitions" do 
      it "returns the index of the column that would result in a win + 1" do 
        board = [['1', '2', '3', '4', '5', '6', '7'],
                 ['-', '-', '-', '-', '-', '-', '-'],
                 ['-', '-', '-', '-', '-', '-', '-'],
                 ['-', '-', '-', '-', '-', 'B', '-'],
                 ['-', '-', '-', '-', 'B', '-', '-'],
                 ['-', '-', '-', 'B', '-', '-', '-'],
                 ['-', '-', '-', '-', '-', '-', '-']]
        current_player_piece = "B"
        expect(player.almost_win_diagonal?(current_player_piece, board)).to eql(6)
      end
    end
=begin
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
=end
  end
end 