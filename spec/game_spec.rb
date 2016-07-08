require 'game'

describe Game do
  let(:board) { Board.new }
  let(:game) { Game.new }
  let(:tie_game) do
    board_grid = game.instance_variable_get(:@board)
    board_grid.instance_variable_set( :@board, [["r", "b", "r", "b", "r", "b"], 
                                                ["b", "r", "b", "r", "b", "r"],
                                                ["r", "b", "r", "b", "r", "b"], 
                                                ["b", "r", "b", "r", "b", "r"], 
                                                ["r", "b", "r", "b", "r", "b"], 
                                                ["b", "r", "b", "r", "b", "r"], 
                                                ["r", "b", "r", "b", "r", "b"]] )  
    return game
  end

  let(:current_player) do
    game.instance_variable_get(:@current_player)
  end

  let(:player1) do
    gam
  end

  let(:player2) do
    game.instance_variable_get(:@player2)
  end

  describe "#game_over?" do

    it "returns true if board is full" do
    
      expect(tie_game.game_over?).to eq(true)

    end
  end

  describe "#switch_player" do
    context "when the current player is player 1" do

      it "sets current player to player 2" do
        game.switch_player
        expect(current_player).to eq (player2)
      end
    end

    context "when the current player is player 2" do

      it "sets current player to player 1" do
      end
    end
  end
  
end