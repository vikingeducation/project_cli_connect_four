require_relative '../lib/board.rb'

describe Board do

  let(:b) {Board.new}

  describe 'initialize' do
    it 'creates a new board' do
      expect(b).to be_a(Board)
    end
  end

  describe 'board is not full at start' do
    it 'board is not full' do
      expect(b.full_board?).to eq(false)
    end
  end

  describe 'add piece' do
    it 'returns true for legally adding a piece' do
      result = b.add_piece(2, :X)
      expect(result).to eq(true)
    end

    it 'returns false for illegally adding a piece' do
      result = b.add_piece(9, :X)
      expect(result).to eq(false)
    end
  end

  describe 'winning combination' do
    it 'returns false when not a winnning pattern' do
      b.add_piece(0, :X)
      b.add_piece(2, :X)
      b.add_piece(4, :X)
      b.add_piece(6, :X)
      expect(b.winning_move?(:X)).to be(false)
    end

    it 'returns true for horizontal win' do
      b.add_piece(0, :X)
      b.add_piece(1, :X)
      b.add_piece(2, :X)
      b.add_piece(3, :X)
      expect(b.horizontal_win?(:X)).to be(true)
    end

    it 'returns true for vertical win' do
      b.add_piece(0, :X)
      b.add_piece(0, :X)
      b.add_piece(0, :X)
      b.add_piece(0, :X)
      expect(b.vertical_win?(:X)).to be(true)
    end

    it 'returns true for diagonal win' do
      b.add_piece(0, :X)
      b.add_piece(1, :O)
      b.add_piece(1, :X)
      b.add_piece(2, :O)
      b.add_piece(2, :O)
      b.add_piece(2, :X)
      b.add_piece(3, :O)
      b.add_piece(3, :O)
      b.add_piece(3, :O)
      b.add_piece(3, :X)
      expect(b.diagonal_win?(:X)).to be(true)
    end
  end

end