load 'lib/game.rb'

describe "Game" do

  describe '#current_player'do
    let(:player){Player.new('red')}
    xit 'returns @player_red if count is odd' do
      expect(Game.new.current_player(1)).to eq(player)
    end

  end

end
