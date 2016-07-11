require "blackjack"

RSpec.describe Blackjack do
  describe "#initialize" do
    it "will intialize without input args" do
      expect(Blackjack.new).to be_a(Blackjack)
    end

    it "will not intialize with input args" do
      expect {Blackjack.new(11)}.to raise_error ArgumentError
    end

    it "will intiate a gambler" do
      bljk = Blackjack.new
      gambler = bljk.instance_variable_get(:@gambler)
      expect(gambler).to be_a(Better)
    end

    it "will intiate a dealer" do
      bljk = Blackjack.new
      gambler = bljk.instance_variable_get(:@dealer)
      expect(gambler).to be_a(Dealer)
    end

  end

  describe "#play" do

  end

  describe "who wins?" do

  end
end
