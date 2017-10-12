require 'human_player'
require 'board'

describe HumanPlayer do 

  let(:player) { HumanPlayer.new }

  it "is a HumanPlayer instance" do 
    expect( subject ).to be_a( HumanPlayer ) 
  end 

  describe "#make_move" do 
    let(:board) { Board.new }
    let(:current_player_piece) { 'R' }
    before { allow(player).to receive(:gets).and_return('5') }
    it "calls #validate_move" do
      expect(player).to receive(:validate_move)
      player.make_move(current_player_piece, board.board, board.diagonals)
    end

    it "receives a value for @column from the user" do 
      player.make_move(current_player_piece, board.board, board.diagonals)
      expect(player.column).to eql(5)
    end
  end
end