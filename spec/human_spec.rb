require 'human'

describe Human do
    let(:bb){Board.new}
    let(:person){Human.new(bb, "X", 1)}

  describe '#choose_column' do
    it "returns array mapping move" do
      allow(person).to receive(:gets).and_return("1")
      expect(person.choose_column).to be_an(Array)
    end
  end

  describe '#valid_choice?' do
    it "returns false if input is outside of column range" do
      expect(person.valid_choice?(10)).to be false
    end
  end


end