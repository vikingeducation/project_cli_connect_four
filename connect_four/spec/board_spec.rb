require "board.rb"

describe "ConnectFour Board Class" do
  empty =    { 1 => Array.new(6),
               2 => Array.new(6),
               3 => Array.new(6),
               4 => Array.new(6),
               5 => Array.new(6),
               6 => Array.new(6),
               7 => Array.new(6) } 

  full =     { 1 => Array.new(6, :r),
               2 => Array.new(6, :r),
               3 => Array.new(6, :r),
               4 => Array.new(6, :r),
               5 => Array.new(6, :r),
               6 => Array.new(6, :r),
               7 => Array.new(6, :r) } 

  partial =  { 1 => [:r, nil, nil, nil, nil, nil],
               2 => Array.new(6, :r),
               3 => Array.new(6, :r),
               4 => Array.new(6, :r),
               5 => Array.new(6, :r),
               6 => Array.new(6, :r),
               7 => Array.new(6, :r) } 

  let(:empty_test_board) { Board.new(empty) }
  let(:full_test_board) { Board.new(full) }
  let(:partial_test_board) { Board.new(partial) }

  describe "#initialize" do
    it "should have a blank game board by default" do
      expect( Board.new.instance_variable_get( :@columns ) ).to eq(empty)
    end
  end

  describe "#full?" do
    it "should return false if the board isn't full" do
      expect( empty_test_board.full? ).to be false
    end

    it "should return false if the board is only partially full" do
      expect( partial_test_board.full? ).to be false
    end

    it "should return true if the board is full" do
      expect( full_test_board.full? ).to be true
    end
  end

  describe "#valid_move?(column)" do
    it "should return true if the column is empty" do
      expect( empty_test_board.valid_move?(1) ).to be true
    end

    it "should return true if the column is only partially full" do
      expect( partial_test_board.valid_move?(1) ).to be true
    end

    it "should print error text and return nil if the column is full" do
      expect( full_test_board.valid_move?(1) ).to be_nil
    end
  end

  describe "#add_piece(column, piece)" do
    it "should add a piece to an empty column" do
      board = Board.new(empty)
      board.add_piece(1, :r)
      test_piece = board.instance_variable_get( :@columns )[1][0]
      expect( test_piece ).to eq(:r)
    end

    it "should add a piece to a partially empty column" do
      board = Board.new(partial)
      board.add_piece(1, :r)
      test_piece = board.instance_variable_get( :@columns )[1][1]
      expect( test_piece ).to eq(:r)
    end

    it "should return nil and not add a piece to a full column" do
      board = Board.new(full)
      expect( board.add_piece(1, :r) ).to be_nil
      expect( board.instance_variable_get( :@columns )[1][6] ).to be_nil
    end
  end

  describe "#winning_line?(piece)" do
    it "should return true if there is a winning horizontal line" do
      horizontal = { 1 => [:r, nil, nil, nil, nil, nil],
                     2 => [:r, nil, nil, nil, nil, nil],
                     3 => [:r, nil, nil, nil, nil, nil],
                     4 => [:r, nil, nil, nil, nil, nil],
                     5 => Array.new(6, nil),
                     6 => Array.new(6, nil),
                     7 => Array.new(6, nil) } 
      board = Board.new(horizontal)
      expect( board.winning_line?(:r) ).to be true
    end

    it "should return true if there is a winning vertical line" do
      vertical = { 1 => [:r, :r, :r, :r, nil, nil],
                   2 => Array.new(6, nil),
                   3 => Array.new(6, nil),
                   4 => Array.new(6, nil),
                   5 => Array.new(6, nil),
                   6 => Array.new(6, nil),
                   7 => Array.new(6, nil) } 
      board = Board.new(vertical)
      expect( board.winning_line?(:r) ).to be true
    end

    it "should return true if there is a winning diagonal line" do
      diagonal = { 1 => [:r, nil, nil, nil, nil, nil],
                   2 => [nil, :r, nil, nil, nil, nil],
                   3 => [nil, nil, :r, nil, nil, nil],
                   4 => [nil, nil, nil, :r, nil, nil],
                   5 => Array.new(6, nil),
                   6 => Array.new(6, nil),
                   7 => Array.new(6, nil) } 
      board = Board.new(diagonal)
      expect( board.winning_line?(:r) ).to be true
    end

    it "should return false if the other player has a winning line" do
      vertical = { 1 => [:r, :r, :r, :r, nil, nil],
                   2 => Array.new(6, nil),
                   3 => Array.new(6, nil),
                   4 => Array.new(6, nil),
                   5 => Array.new(6, nil),
                   6 => Array.new(6, nil),
                   7 => Array.new(6, nil) } 
       board = Board.new(vertical)
       expect( board.winning_line?(:y) ).to be false
    end

    it "should return false if there is no winning line" do
      blocked = { 1 => [:r, :r, :y, :r, nil, nil],
                   2 => Array.new(6, nil),
                   3 => Array.new(6, nil),
                   4 => Array.new(6, nil),
                   5 => Array.new(6, nil),
                   6 => Array.new(6, nil),
                   7 => Array.new(6, nil) } 
       board = Board.new(blocked)
       expect( board.winning_line?(:r) ).to be false      
    end
  end
end