require 'better'

RSpec.describe Better do
  let(:better) { Better.new  }

  describe "#initialize" do
    it 'intializes better without input args' do
      expect(better).to be_a(Better)
    end

    it 'does not initialize with input arts' do
      expect {Better.new(11)}.to raise_error ArgumentError
    end
  end

  describe '#hand_sum' do
    it 'will sum up hand 5 & 6' do
      expect(better.hand_sum(5,6)).to eq 11
    end

    it 'will sum up hand 3 & 4' do
        expect(better.hand_sum(3,4)).to eq 7
    end

    it 'will sum hand 3, 4, & 5' do
      expect(better.hand_sum(3,4,5)).to eq 12
    end

    it 'will sum hand 4, 5, 11' do
      expect(better.hand_sum(4,5,11)).to eq 20
    end

    it 'will sum hand 2, 3, 2, 4, 5, 3, 10, 10' do
      expect(better.hand_sum(2, 3, 2, 4, 5, 3, 10, 10)).to eq 39
    end
  end

  describe "" do

  end
end
