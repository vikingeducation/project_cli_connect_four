require 'board'

describe Board do

  let(:b){Board.new}
  let(:full_b){Board.new(Array.new(7) { Array.new(6, "O") })}
  let(:alternating_column_b){Board.new(Array.new(7) { ['X', 'O']  * 3 })}

  describe '#initialize' do
    it "creates a board" do
      expect(b).to be_a(Board)
    end

    it "presents an empty board by default" do
      expect(b.columns).to be{Array.new(7) { Array.new(6, '-') }}
    end
  end

  describe '#rows' do
    it "returns an array" do
      expect(b.rows(0)).to be_an(Array)
    end
  end

  describe '#process_choice' do
    it "returns an array" do
      expect(b.process_choice(2, "O")).to be_an(Array)
    end
  end

  describe '#draw' do
    it "returns true when board is full" do
      expect(full_b.draw?).to be true 
    end

    it "returns false when board is not full" do 
      expect(b.draw?).to be false 
    end
  end

  describe '#test_object' do
    it "returns true if array has four consecutive elements" do
      expect(b.test_object(%w(s s s s), "s")).to be true
    end

    it "returns false if array doesn't have four consecutive elements" do
      expect(b.test_object(%w(a b c d), "O")). to be false
    end
  end

  describe '#vertical_win?' do
    it 'returns true if a column has four consecutive pieces' do
      expect(full_b.vertical_win?(3, "O")).to be true
    end

    it 'returns false if a column does not include four consecutive pieces' do
      expect(b.vertical_win?(3, "O")).to be false
    end
  end

  describe '#horizontal_win?' do
    it 'returns true if a row has four consecutive pieces' do
      expect(alternating_column_b.horizontal_win?(0, "X")).to be true
    end

    it 'returns false if a row does not include four consecutive pieces' do
      expect(b.horizontal_win?(2, "O")).to be false
    end
  end




#class ends here
end
