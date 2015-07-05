require 'connect_four'

describe Game do
  describe 'players in a game exist' do
    let(:game){Game.new}
    it 'creates correct player' do
      #allow(game).to receive(:gets).and_return("")
      expect(game.instance_variable_get(:@players).class).to be(Array)
    end
  end
end