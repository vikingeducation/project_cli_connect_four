load 'lib/game.rb'

describe "Game" do

  describe '#current_player'do

    it 'returns @color == "red" if count is odd' do
      expect(Game.new.current_player(1).color).to eq(Player.new('red').color)
    end

  end

end
