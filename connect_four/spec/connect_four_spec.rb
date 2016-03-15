require "spec_helper"
require "connect_four"

describe ConnectFour do 
  let(:game) {ConnectFour.new}
  describe "#initialize" do
    it "should create a game object" do
      expect(game).to be_a(ConnectFour)
    end
  end
end