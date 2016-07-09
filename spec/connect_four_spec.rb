require 'spec_helper'
require 'connect_four'
require 'board'
require 'piece'

RSpec.describe ConnectFour do
  # let(:game) {ConnectFour.new}
  subject(:board) {Board.new}

  describe 'initialize' do
    it 'will not create game with out user input' do
      expect {ConnectFour.new}.not_to raise_error
    end
  end

  # describe "get_players_names"

  # describe 'play'

  # describe "#player_moves(player)"

  # describe 'win?' do
  #
  # end


  describe 'full_board?' do

  end

  describe 'check_win(arrays)' do
    it "will return true(win) if a row is filled with four consectutive pieces" do
      winning_horizontal = [[Piece.new("R")], [Piece.new("R")], [Piece.new("R")], [Piece.new("R")], [], [], []]
      expect(ConnectFour.new.check_win(winning_horizontal)).to eq(true)
    end
  end


end
