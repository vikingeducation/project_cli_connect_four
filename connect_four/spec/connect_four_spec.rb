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
end
