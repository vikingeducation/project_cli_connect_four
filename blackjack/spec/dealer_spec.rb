require 'dealer'

RSpec.describe Dealer do
  let(:dealer) { Dealer.new  }

  describe "#initialize" do
    it "will initialize dealer without args" do
      expect {Dealer.new}.to_not raise_error
      expect(Dealer.new).to be_a(Dealer)
    end

    it "will not initialize dealer wit args" do
      expect {Dealer.new("fred")}.to raise_error ArgumentError
    end
  end

  describe "will sum up dealers hand" do

    it 'will sum up hand 5 & 6' do
      expect(dealer.hand_sum([5,6])).to eq 11
    end

    it 'will sum up hand 3 & 4' do
        expect(dealer.hand_sum([3,4])).to eq 7
    end

    it 'will sum hand 3, 4, & 5' do
      expect(dealer.hand_sum([3,4,5])).to eq 12
    end

    it 'will sum hand 4, 5, 11' do
      expect(dealer.hand_sum([4,5,11])).to eq 20
    end

    it 'will sum hand 2, 3, 2, 4, 5, 3, 10, 10' do
      expect(dealer.hand_sum([2, 3, 2, 4, 5, 3, 10, 10])).to eq 39
    end
  end

  describe "#get_new_card?" do
    let(:dealer_double) do
      double("dealer", )
    end

    it "will give dealer card unless total > 16" do
      dealer.instance_variable_set( :@cards, [3, 5])
      expect(dealer.get_new_card?).to eq true
    end

    it "will not give dealer card if total >= 16" do
      dealer.instance_variable_set( :@cards, [10, 7])
      expect(dealer.get_new_card?).to eq false
    end
  end
end
