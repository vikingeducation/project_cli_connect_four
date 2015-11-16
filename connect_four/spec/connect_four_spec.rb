require_relative '../lib/connect_four.rb'

describe 'ConnectFour' do

  let(:game1){ConnectFour.new(1)}
  let(:game2){ConnectFour.new(2)}

  describe '#initialize' do

    it 'should give you a ConnectFour' do
      expect(game1).to be_a(ConnectFour)
    end

    it 'should not give readable access to instance variables' do
      expect{game1.board}.to raise_error(NoMethodError)
      expect{game1.player1}.to raise_error(NoMethodError)
      expect{game1.player2}.to raise_error(NoMethodError)
      expect{game1.current_player}.to raise_error(NoMethodError)
    end
  end

  describe '#play' do

    it 'should switch players and check for game win' do
      allow(game1).to receive(:game_over?).and_return(false, true)
      expect(game1).to receive(:game_over?)
      expect(game1).to receive(:game_over?)
      expect(game1).to receive(:switch_player)
      game1.play
    end

  end

end