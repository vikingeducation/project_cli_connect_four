require 'spec_helper'
require_relative '../lib/player.rb'

describe "Player" do
  let(:player){ Player.new("R") }
  let(:board){ Board.new }

  describe "#add_piece" do

    before "setup board" do
      board.setup
    end

    it "returns true piece has been added" do
      expect(player.add_piece(1, board)).to eq(true)
    end

    it "adds a piece to the correct column" do
      player.add_piece(1, board)
      expect(board.board[6][0]).to eq("R")
    end

  end

end