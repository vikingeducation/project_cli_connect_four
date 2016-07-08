require 'player'

describe Player do
  let(:player){Player.new("Guy","X")}

  describe '#initialize' do
    it "should take 2 arguments" do
      expect{Player.new("Guy")}.to raise_error(ArgumentError)
    end

    it "should create a name" do
      expect(player.name).to eq("Guy")
    end

    it "should create a piece" do
      expect(player.piece).to eq("X")
    end
  end

  describe '#get_input' do
    it "should return an input which is an Integer" do
    end

    it "should return an input in valid range" do
    end
  end

end