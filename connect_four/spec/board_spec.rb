require 'spec_helper'

describe Board do
  subject(:b){Board.new}

  describe ".initialize" do

    it "creates a grid of seven empty arrays" do
      expect(b.grid).to eq(Array.new(7){[]})
    end
  end

  describe "#grid" do
    it "is a method of a board object" do
      expect(b).to respond_to(:grid)
    end
  end

  describe "#grid=()" do
    it "sets board object's :grid" do
      b.grid = Array.new(7){"a"}
      expect(b.grid).to eq(Array.new(7){"a"})
    end
  end

  describe "#move" do
    it "add's players piece to said column" do
      b.move(1, "X")
      expect(b.grid[0][-1]).to eq("X")
    end

    it "requires exactly 2 arguments" do
      expect{b.move()}.to raise_error(ArgumentError)
      expect{b.move("s")}.to raise_error(ArgumentError)
      expect{b.move("s", "s", "s")}.to raise_error(ArgumentError)
    end

  end

  describe "#victory?" do
    it "doesn't take any arguments" do
      expect{b.victory?("foo", "bar")}.to raise_error(ArgumentError)
      expect{b.victory?("foo")}.to raise_error(ArgumentError)
    end

    it "returns a boolean" do
      expect(Board.new.victory?).to be_falsey
    end


    it "returns true when the board has a vertical win" do
      b.grid = [ %w(X X X X) ]
      expect(b.victory?).to be_truthy
    end

    it "returns true when the board has a horizontal win" do
      b.grid = [["a"], ["a"], ["a"], ["a"] ]
      expect(b.victory?).to be_truthy
    end

    it "returns true when the board has a diagonal win" do
      b.grid = [ %w(O O O X), %w(O O X O), %w(O X O O), %w(X O O O), [], [], [] ]
      expect(b.victory?).to be_truthy
    end

  end

  describe "#draw?" do
    it "doesn't take any arguments" do
      expect{b.draw?("foo")}.to raise_error(ArgumentError)
    end

    it "returns a boolean" do
      expect(b.draw?).to be_falsey
    end

    it "returns true if game board is full" do
      b.grid = Array.new(7){%w[a a a a a a]}
      expect(b.draw?).to be_truthy
    end
  end

  describe "#game_over?" do
    it "takes no argument" do
      expect{b.game_over?("foo")}.to raise_error(ArgumentError)
    end

    it "returns false by default" do
      expect(b.game_over?).to be_falsey
    end

    it "return true if victory? or draw?" do
      b.grid = Array.new(7){%w[a a a a a a]}
      expect(b.game_over?).to be_truthy
    end

    it "returns true if victory?" do
      b.grid = [["a"], ["a"], ["a"], ["a"] ]
      expect(b.game_over?).to be_truthy
    end
  end

  describe "#column_full?" do
    it "takes exactly one argument" do
      expect{b.column_full?}.to raise_error(ArgumentError)
      expect{b.column_full?("a", "a")}.to raise_error(ArgumentError)
    end

    it "returns false by default" do
      expect(b.column_full?(rand(7))).to be_falsey
    end

    it "returns true if column if full" do
      b.grid = [ %w(X X X X X X) ]
      expect(b.column_full?(0)).to be_truthy
    end

  end

  describe "#fill_copy" do
    it "takes exactly one argument" do
      expect{b.fill_copy}.to raise_error(ArgumentError)
      expect{b.fill_copy("a", "a")}.to raise_error(ArgumentError)
    end

    it "takes a board and outputs an array" do 
      expect(b.fill_copy(b.grid)[rand(7)]).to be_a(Array)
    end

    it "the output array is an array of elements of length 6" do
      expect(b.fill_copy(b.grid)[rand(7)].length).to eq(6)
    end

    it "the return array should be a duplicate of the original array" do 
      expect(b.fill_copy(b.grid).object_id).not_to eql(b.grid.object_id)
    end

    it "the return array should contain arrays with different object id's than those contained by the original array" do 
      i = rand(7)
      expect(b.fill_copy(b.grid)[i].object_id).not_to eql(b.grid[i].object_id)
    end

  end
end
