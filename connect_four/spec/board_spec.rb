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
    # array of 7 arrays. each array is a column. start out empty. 
    # 
  end

  describe "#draw?" do

  end

  describe "#game_over?" do

  end

  describe "#column_full?" do

  end

  describe "#fill_copy" do
    
  end
end
