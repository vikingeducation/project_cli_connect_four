require 'spec_helper'
require_relative '../lib/computer.rb'

describe "Computer" do

  let(:comp){ Computer.new("R") }
  let(:board) { Board.new }

  describe "#select_move" do

    it "selects random number when no winning move available" do
      board.setup
      # expect((1..7).include?(comp.select_move)).to eq(true)
      expect(comp.select_move).to include(1..7)
    end


  end
end