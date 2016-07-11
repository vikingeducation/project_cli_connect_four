require "player"

RSpec.describe Player do
  let(:player) { Player.new }
  let(:fake_player) { instance_double("Player") }

  describe "#initialize" do
    it 'intializes player without input args' do
      expect(Player.new).to be_a(Player)
    end

    it 'will not intialize player with input args' do
      expect {Player.new("")}.to raise_error ArgumentError
    end
  end


  describe '#hand_sum' do

    it 'will sum up hand 5 & 6' do
      player.instance_variable_set(:@cards, [5,6])
      expect(player.hand_sum).to eq 11
    end

    it 'will sum up hand 3 & 4' do
      player.instance_variable_set(:@cards, [3,4])
      expect(player.hand_sum).to eq 7
    end

    it 'will sum hand 3, 4, & 5' do
      player.instance_variable_set(:@cards, [3,4,5])
      expect(player.hand_sum).to eq 12
    end

    it 'will sum hand 4, 5, 11' do
      player.instance_variable_set(:@cards, [4,5,11])
      expect(player.hand_sum).to eq 20
    end

    it 'will sum hand 2, 3, 2, 4, 5, 3, 10, 10' do
      player.instance_variable_set(:@cards, [2, 3, 2, 4, 5, 3, 10, 10])
      expect(player.hand_sum).to eq 39
    end
  end

  describe "#deal_card" do
    it "will increase empty cards arr by 1" do
      card_length = player.instance_variable_get(:@cards).length
      expect(card_length).to eq(0)
      player.deal_card
      card_length = player.instance_variable_get(:@cards).length
      expect(card_length).to eq(1)
    end

    it "will add a valid card to the @cards array" do
      player.deal_card
      card = player.instance_variable_get(:@cards)[0]
      expect(card).to_not be nil
      expect(card).to be_a(Integer)
    end
  end

  describe "#place_bet" do

    it "will identify bet placed by player"
  end
end
