require 'board'

describe Board do

  let(:b){Board.new}
  let(:full_b){Board.new(Array.new(7) { Array.new(6, "O") })}

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

  describe '#win' do
    it "returns false if no wins" do
      expect(b.win?([0,0,"O"])).to be false
    end

    it "returns true if vertical win" do
      board = [
          ["O", "O", "O", "O", "O", "O"],
          ["-", "-", "-", "-", "-", "-"],
          ["-", "-", "-", "-", "-", "-"],
          ["-", "-", "-", "-", "-", "-"],
          ["-", "-", "-", "-", "-", "-"],
          ["-", "-", "-", "-", "-", "-"],
          ["-", "-", "-", "-", "-", "-"]
        ]
      expect(Board.new(board).win?([0,0,"O"])).to be true
    end

    it "returns true if horizontal win" do
      board = [
          ["O", "-", "-", "-", "-", "-"],
          ["O", "-", "-", "-", "-", "-"],
          ["O", "-", "-", "-", "-", "-"],
          ["O", "-", "-", "-", "-", "-"],
          ["O", "-", "-", "-", "-", "-"],
          ["O", "-", "-", "-", "-", "-"],
          ["O", "-", "-", "-", "-", "-"]
        ]
      expect(Board.new(board).win?([0,0,"O"])).to be true
    end

    it "returns true if upper diagonal win" do 
      board = [
          ["-", "-", "-", "-", "-", "-"],
          ["-", "-", "-", "-", "-", "-"],
          ["-", "-", "-", "-", "-", "-"],
          ["O", "-", "-", "-", "-", "-"],
          ["-", "O", "-", "-", "-", "-"],
          ["-", "-", "O", "-", "-", "-"],
          ["-", "-", "-", "O", "-", "-"]
        ]
      expect(Board.new(board).win?([3,0,"O"])).to be true
    end

    it "returns true if downward diagonal win" do
      board = [
        ["-", "-", "-", "O", "-", "-"],
        ["-", "-", "O", "-", "-", "-"],
        ["-", "O", "-", "-", "-", "-"],
        ["O", "-", "-", "-", "-", "-"],
        ["-", "-", "-", "-", "-", "-"],
        ["-", "-", "-", "-", "-", "-"],
        ["-", "-", "", "-", "-", "-"]
      ]
      expect(Board.new(board).win?([0,3,"O"])).to be true
    end
  end
end
