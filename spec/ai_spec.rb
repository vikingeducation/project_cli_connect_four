require 'ai'

describe AI do
  let(:bb){Board.new}
  let(:robo){AI.new(bb,"O",2)}

  describe '#available_moves' do
    it "returns an array of columns that aren't full" do
      expect(robo.available_moves).to be_an(Array)
    end
  end

  describe '#better_moves' do
    it "returns array of columns with 3 consecutive pieces" do
      expect(robo.better_moves).to be_an(Array)
    end
  end

  describe '#choose_column' do
    it "returns array mapping computer's move on board" do
      expect(robo.choose_column).to be_an(Array)
    end
  end
end