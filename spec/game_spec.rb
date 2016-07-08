require 'game'

describe Game do

  describe "#game_over?" do
    let(:board) { Board.new }
    let(:game) { Game.new }
    let(:tie_board_grid) do
      (0..6).each do |col|
        3.times do

        if col.even?
          board.add_piece('r', col)
          board.add_piece('b', col)
        else
          board.add_piece('b', col)
          board.add_piece('r', col)
        end

        end
      end
    end

    it "returns true if board is full" do
      #fill up board without winning

      expect(game.game_over?).to eq(true)

    end
  end
  
end