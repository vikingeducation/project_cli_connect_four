require 'game'

describe Game do

# lets statements here

  let(:game){Game.new}

  describe '#string_is_integer?' do

    it 'returns false if a string cannot be converted to an integer' do
      expect(game.string_is_integer?('r')).to be false
    end  

    it 'returns true if a string can be converted to an integer' do
      expect(game.string_is_integer?('6')).to be true
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
# valid_column?
# draw?
# winner?
# switch_player