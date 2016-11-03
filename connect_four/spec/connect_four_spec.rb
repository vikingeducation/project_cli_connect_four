require 'spec_helper'
require 'execute'

describe ConnectFour do
   let(:game) {ConnectFour.new}

   describe "#initilaize" do
     it "has a board global variable" do
       expect(game.instance_variable_get(:@board)).to be_a(Board)
     end

     it "has a player1 global variable" do
       expect(game.instance_variable_get(:@player1)).to be_a(Player)
     end

     it "has a player2 global variable" do
       expect(game.instance_variable_get(:@player2)).to be_a(Player)
     end

     it "has a current player global variable" do
       expect(game.instance_variable_get(:@current_player)).to be_a(Player)
     end
  end

  describe "#switch_players" do
    it "alternates between players" do
      current_player = game.instance_variable_get(:@current_player)
      game.switch_players
      expect(game.instance_variable_get(:@current_player)).not_to eq(current_player)
    end

    it "alternates a second time" do
      current_player = game.instance_variable_get(:@current_player)
      game.switch_players
      game.switch_players
      expect(game.instance_variable_get(:@current_player)).to eq(current_player)
    end

  end

  describe "#game_over?" do
    it "returns true if board is full" do
      game.board.layout =  Array.new(7){Array.new(6) {'X'}}

      expect(game.game_over?).to be true
    end

    it "returns true if there are 4 in a row"
    it "returns false if board isn't full, and there aren't 4 in a row"


  end



end
