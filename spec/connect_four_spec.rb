require 'connect_four'

describe "Board" do

  let(:board){ Board.new }

  describe "#new board" do

    it "has 6 empty arrays" do
      def empty_board?(columns)
        i = 1
        while i <= board.columns.length
          if board.columns[i].length > 0
            return false
          end
          i += 1
        end
        return true
      end
      expect(empty_board?(board.columns)).to be(true)
    end

  end

end

describe "Game Class" do

  let(:game_1_player){ Game.new(1) }
  let(:game_2_player){ Game.new(2) }

  describe "new game" do

    it "starts with an empty board" do
      expect(game_1_player.check_full_board).to be(false)
    end

  end

end
