require 'player'
require 'human'

describe Human do

  let( :human ) { Human.new("green") }
  let( :human_no_color ) { Human.new }

  describe "#initialize" do
    it "initializes properly" do
      expect(human).to be_an_instance_of(Human)
    end

    it "initializes with color properly" do
      expect(human.color).to eq("green")
    end

    it "throws ArgumentError if no color given" do
      expect{human_no_color}.to raise_error(ArgumentError)
    end

  end

  describe "#player_move" do
    it "returns player input properly" do
      allow(human).to receive(:gets).and_return("1")
      expect(human.player_move).to be_an_instance_of(Fixnum)
    end

    it "does not return invalid input" do
      allow(human).to receive(:gets).and_return("A", "6")
      expect(human.player_move).to be_an_instance_of(Fixnum)
    end
  end
end