require 'connect_four'
require 'spec_helper'

describe Board do
	let(:board) { Board.new }

	describe "#initialize" do 

		it "should be a board" do
			expect(board).to be_a(Board)
		end
	end

	describe "#winning_vertical?" do 

		it "returns true if player has four vertical pieces in a row" do 

			test_board =  [["-", "-", "-", "-", "-", "-", "-"],
 +                   ["-", "-", "-", "-", "-", "-", "-"],
+                    ["-", "-", :x,  "-", "-", "-", "-"],
  +                  ["-", "-", :x,  "-", "-", "-", "-"],
 +                   ["-", "-", :x,  "-", "-", "-", "-"],
 +                   ["-", "-", :x,  "-", "-", "-", "-"],
 +                   ["-", "-", "-", "-", "-", "-", "-"]]

 			expect(Board.new(test_board).winning_vertical?(:x).to be_truthy
 		end

 		describe "#winning_horizontal?" do 

		it "returns true if player has four horizontal pieces in a row" do 

			test_board =  [["-", "-", "-", "-", "-", "-", "-"],
 +                   ["-", "-", "-", "-", "-", "-", "-"],
 +                   ["-", "-", "",  "-", "-", "-", "-"],
 +                   ["-", "-", "",   :x,  :x,  :x,  :x],
 +                   ["-", "-", "",  "-", "-", "-", "-"],
 +                   ["-", "-", "",  "-", "-", "-", "-"],
 +                   ["-", "-", "-", "-", "-", "-", "-"]]

 			expect(Board.new(test_board).winning_horizontal?(:x).to be_truthy
 		end

end

describe ConnectFour do 

	let(:game) { ConnectFour.new}

	describe "#switch_player" do

		it "switches players" do 
			expect(game.switch_player).to eq(game.player_y)
		end
		
	end
end