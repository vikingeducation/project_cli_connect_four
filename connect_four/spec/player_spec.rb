require 'spec_helper'


describe "Player" do
  subject(:p){Player.new("player1", "X")}

  describe ".initialize" do

    it "requires exactly two arguments" do
      expect{Player.new("a", "b", "c")}.to raise_error(ArgumentError)
    end
  end


  describe "#name" do
    it "returns the value of player's name" do
      expect(p.name).to eq("player1")
    end
  end

  describe "#piece" do
    it "returns the value of player's piece" do
      expect(p.piece).to eq("X")
    end
  end

  describe "#get_input" do
    it "requires exactly one argument" do
      expect{p.get_input}.to raise_error(ArgumentError)
      expect{p.get_input("a", "b")}.to raise_error(ArgumentError)
    end

    it "returns an integer from 1-7" do
      i = rand(7)+1
      allow(p).to receive(:gets).and_return(i.to_s)
      expect(p.get_input(Board.new)).to eq (i)
    end

    it "returns an integer" do
      expect(p.get_input(Board.new)).to be_a(Integer)
    end
  end


end
