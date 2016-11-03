load 'lib/game.rb'

describe "Game" do

  describe '#current_player'do

    it 'returns @color == "red" if count is odd' do
      expect(Game.new.current_player(1).color).to eq('red')
    end

    it 'returns @color == "blue" if count is even' do
      expect(Game.new.current_player(2).color).to eq('blue')
    end

  end

  describe '#board_full' do

    it 'returns true if board is full' do
      expect(Game.new.board_full?(44)).to be true
    end

    it 'returns false if board has open spots' do
      expect(Game.new.board_full?(19)).to be false
    end
  end

end
