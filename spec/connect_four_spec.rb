require 'connect_four'

describe "Game" do

  let(:game) { Game.new(1) }

  describe "#switch_player method" do

    it "switches players properly" do
      if game.current_player == game.player1
        game.switch_player
        expect(game.current_player).to eq(game.player2)
      end
    end

  end

  describe "#check_full_board" do

    it "checks if a board is full or not" do
      expect(game.check_full_board).to be(false)
    end

  end

  describe "#check_move" do

    it "adds piece after valid move" do
      game.check_move(1)
      expect(game.board.columns[1].length).to eq(1)
    end

    it "pending checks invalid moves"

  end

end

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

describe "Computer" do

  describe "#get_move method" do

    let(:computer){ Computer.new("X", "The Computer") }

    it "chooses a number between 1 and 6" do
      expect(computer.get_move).to be <= (6)
    end

  end

  describe "#new method" do

    it "raises an error if no arguments provided" do
      expect {Computer.new}.to raise_error(ArgumentError)
    end

  end

end

describe "Player" do

  describe "#new method" do

    it "raises an error if no arguments provided" do
      expect {Player.new}.to raise_error(ArgumentError)
    end

  end

  describe "#get_move" do

    it "pending validates moves"

  end

end
