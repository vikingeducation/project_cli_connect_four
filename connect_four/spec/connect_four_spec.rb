require 'connect_four'
require 'players'
require 'board'

describe ConnectFour do
  describe "#initialize" do
    it 'should be a ConnectFour' do
      expect(ConnectFour.new).to be_a(ConnectFour)
    end
  end

end
