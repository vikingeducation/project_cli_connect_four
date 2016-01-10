require 'spec_helper'
require_relative '../lib/computer.rb'

describe "Computer" do

  let(:comp){ Computer.new("B") }
  let(:board) { Board.new }

  describe "#select_move" do

    it "selects random number when no winning move available" do
      board.setup
      expect(1..7).to cover(comp.select_move)
    end

    it "if there is a winning move return the winning column" do
      board.test_right
      comp.board = board
      expect(comp.select_move).to eq(5)
    end

  end
end