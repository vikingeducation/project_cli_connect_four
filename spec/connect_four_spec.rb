require 'spec_helper'
require 'connect_four'
require 'board'

RSpec.describe ConnectFour do
  # let(:game) {ConnectFour.new}

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

  # describe 'check_win(arrays)'

end
