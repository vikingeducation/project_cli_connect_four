require "board.rb"

describe "ConnectFour Board" do

  let(:empty_test_board) { { 1 => Array.new(6),
                             2 => Array.new(6),
                             3 => Array.new(6),
                             4 => Array.new(6),
                             5 => Array.new(6),
                             6 => Array.new(6),
                             7 => Array.new(6) } }
  let(:board) { Board.new }

  describe "#initialize" do
    it "should have a blank game board by default" do
      expect( Board.new.instance_variable_get( :@columns ) ).to eq(empty_test_board)
    end
  end
end