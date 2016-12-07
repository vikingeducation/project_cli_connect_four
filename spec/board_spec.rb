require 'board'

describe Board do

  let(:b){Board.new}

  describe '#initialize' do
    it "creates a board" do
      expect(b).to be_a(Board)
    end

    it "presents an empty board" do
      expect(b.columns).to be{Array.new(7) { Array.new(6, '-') }}
    end

  end

  describe '#rows' do
    it "returns an array object" do
      expect(b.rows(0)).to be_an(Array)
    end
  end

  describe '#test_object' do
    it "joins an array"

    it "returns true if array has four consecutive elements"
  end

  describe '#horizontal_win?' do
    it 'returns true if a row has four consecutive pieces'

    it 'returns false if a row does not include four consecutive pieces'
  end

  describe '#vertical_win?' do
    it 'returns true if a column has four consecutive pieces'

    it 'returns false if a column does not include four consecutive pieces'
  end

  describe '#generate_diagonal' do
    it 'generates an upward diagonal' 

    it 'generates a downward diagonal'

    it 'refrains from generating an array with nil elements'
  end

  describe '#upward_diagonal' do
    it 'generates upward diagonal array containing piece passed'
  end

  describe '#downward_diagonal' do 
    it 'generates upward diagonal array containing piece passed'
  end

  describe '#draw' do
    it "returns true when board is full"
    it "returns false when board is not full"
  end

  describe '#win' do
    it "returns true when horizontal win"
    it "returns true when vertical win"
    it "returns true when diagonal win"
    it "returns false when no horizontal, vertical, or diagonal win"
  end



#class ends here
end
