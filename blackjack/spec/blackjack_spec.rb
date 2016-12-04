require "blackjack"

RSpec.describe Blackjack do
  let(:bljk) {Blackjack.new}

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
      dealer = bljk.instance_variable_get(:@dealer)
      expect(dealer).to be_a(Dealer)
    end

  end

  describe "#play" do

  end

  describe "#deal_card" do
    it 'will increase players card total by 1' do

      gambler = bljk.instance_variable_get(:@gambler)
      gambler.deal_card
      cards = gambler.instance_variable_get(:@cards)
      expect(cards.length).to eq 1

      dealer = bljk.instance_variable_get(:@dealer)
      dealer.deal_card
      cards = dealer.instance_variable_get(:@cards)
      expect(cards.length).to eq 1
    end

    it "will incrementally add cards with each call to deal_card" do
      gambler = bljk.instance_variable_get(:@gambler)
      2.times {gambler.deal_card}
      cards = gambler.instance_variable_get(:@cards)
      expect(cards.length).to eq 2

      dealer = bljk.instance_variable_get(:@dealer)
      10.times {dealer.deal_card}
      cards = dealer.instance_variable_get(:@cards)
      expect(cards.length).to eq 10
    end
  end


  describe "#win?" do

    it "will return true when gambler ends game with higher total" do
      gambler = bljk.instance_variable_get(:@gambler)
      dealer = bljk.instance_variable_get(:@dealer)
      gambler.instance_variable_set(:@cards, [1])
      dealer.instance_variable_set(:@cards, [0])
      expect(bljk.win?).to eq true

      gambler.instance_variable_set(:@cards, [1, 10, 10])
      dealer.instance_variable_set(:@cards, [10, 10])
    end

    it "will return true when dealer ends game with higher total" do
      gambler = bljk.instance_variable_get(:@gambler)
      dealer = bljk.instance_variable_get(:@dealer)
      gambler.instance_variable_set(:@cards, [0])
      dealer.instance_variable_set(:@cards, [1])
      expect(bljk.win?).to eq false

      gambler.instance_variable_set(:@cards, [10, 10])
      dealer.instance_variable_set(:@cards, [1, 10, 10])
      expect(bljk.win?).to eq false
    end

    it "will return false when gamber and dealer have same total" do
      gambler = bljk.instance_variable_get(:@gambler)
      dealer = bljk.instance_variable_get(:@dealer)
      gambler.instance_variable_set(:@cards, [1, 10])
      dealer.instance_variable_set(:@cards, [1, 10])
      expect(bljk.win?).to eq false
    end
  end

  describe "#payout" do
    it "will payout equivalent to bet of $100 with winning cards total" do
      expect(bljk.payout(100)).to eq 100
    end

    it "will payout equivalent to bet of $5000 with winning cards total" do
      expect(bljk.payout(5000)).to eq 5000
    end

    it "will payout 1.5x bet of $100 with gambler getting blackjack" do
      gambler = bljk.instance_variable_get(:@gambler)
      gambler.instance_variable_set(:@cards, [11, 10])
      expect(bljk.payout(100)).to eq 150
    end
  end
end
