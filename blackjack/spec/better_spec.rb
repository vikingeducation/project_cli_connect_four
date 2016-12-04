require 'better'

RSpec.describe Better do
  let(:better) { Better.new  }

  describe "#initialize" do
    it 'intializes better without input args' do
      expect(Better.new).to be_a(Better)
    end

    it 'does not initialize with input arts' do
      expect {Better.new(11)}.to raise_error ArgumentError
    end
  end

  describe "#get_new_card?" do

    it "will result true if unless total > 16" do
      better.instance_variable_set( :@cards, [15])
      expect(better.get_new_card?).to eq true
    end

    it "will result false if unless total < 20" do
      better.instance_variable_set( :@cards, [15, 6])
      expect(better.get_new_card?).to eq false
    end
  end
end
