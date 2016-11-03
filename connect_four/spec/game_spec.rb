require 'game'
require 'board'
require 'player'

describe Game do

  let(:game){Game.new}

  describe '#string_is_integer?' do

    it 'returns false if a string cannot be converted to an integer' do
      expect(game.string_is_integer?('r')).to be false
    end

    it 'returns true if a string can be converted to an integer' do
      expect(game.string_is_integer?('6')).to be true
    end

  end

  describe '#valid_column?' do

    it 'returns false given an invalid column' do
      expect(game.valid_column?(7)).to be false
    end

    it 'returns true given a valid column' do
      expect(game.valid_column?(6)).to be true
    end

  end

  describe '#draw?' do

    it 'calls Board.board_full?' do
      expect(game.board).to receive(:board_full?)
      game.draw?
    end

  end

  describe '#winner?' do

    it 'calls Board.detected_win?' do
      game.player_config
      expect(game.board).to receive(:detected_win?).with("X")
      expect(game.board).to receive(:detected_win?).with("O")
      game.winner?
    end

  end

end

# initialize
# player
# player_config
# setup_board
# game_loops
# player_input
# instructions
# move_valid?
# switch_player
