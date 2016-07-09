require 'spec_helper'
require 'connect_four'

describe ConnectFour do 

  let (:game) {ConnectFour.new}

  describe '#next_player' do
    it 'current player is player_one' do
      expect(game.current_player).to eq(game.player_one)
    end

    it 'next player is player_two' do
      game.next_player
      expect(game.current_player).to eq(game.player_two)
    end

  end

  describe '#game_over?' do
    it 'return true if game is over' do
      expect(game.game_over?).to be false
    end
  end
end