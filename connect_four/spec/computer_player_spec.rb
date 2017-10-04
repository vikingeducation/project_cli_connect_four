require 'computer_player'

describe ComputerPlayer do 

  let(:player) { ComputerPlayer.new }

  describe "#almost_win_horizontal?" do 
    context "there is a row on the board with three of the same game piece in consecutive postitions" do 
      it "returns truthy value" do 
        board = [['1', '2', '3', '4', '5', '6', '7'],
                 ['-', '-', '-', '-', '-', '-', '-'],
                 ['-', '-', '-', '-', '-', '-', '-'],
                 ['-', '-', '-', '-', '-', '-', '-'],
                 ['-', '-', '-', '-', '-', '-', '-'],
                 ['-', '-', '-', 'R', 'R', 'R', '-'],
                 ['-', '-', '-', '-', '-', '-', '-']]
        current_player_piece = "R"
        expect(player.almost_win_horizontal?(current_player_piece, board)).to be_truthy
      end
    end
  end
end 