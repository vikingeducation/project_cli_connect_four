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
