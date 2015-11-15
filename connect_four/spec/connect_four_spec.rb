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

    # TODO:  I feel like this should be tested somehow
    it 'should play'
  end

end