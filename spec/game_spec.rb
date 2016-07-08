require 'game'

describe Game do

  describe "#game_over?" do
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


    it "returns true if board is full" do
    
      expect(tie_game.game_over?).to eq(true)

    end
  end
  
end