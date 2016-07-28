require './connect_four/board.rb'

describe Board do

  let(:board){ Board.new }

  describe '#add_piece' do
    it 'return true for adding a piece in the board' do
      result = board.add_piece([1, 1], :O)
      expect(result).to be_truthy
    end
    it 'resturn false for adding a piece in a place twice' do
      board.add_piece([1, 1], :O)
      result = board.add_piece([1, 1], :O)
      expect(result).to be_falsy
    end
    it 'return false for invalid coordinates input' do
      result = board.add_piece([10, 10], :O)
      expect(result).to be_falsy
    end
    it 'raise ArgumentError when no symbol is included' do
      expect{ board.add_piece([1, 1]) }.to raise_error(ArgumentError)
    end
  end

  describe '#winning_combination?' do
    it 'return false with not winning pattern' do
      board.add_piece([0, 0], :O)
      board.add_piece([0, 1], :O)
      board.add_piece([0, 2], :O)
      board.add_piece([0, 3], :O)
      board.add_piece([0, 5], :O)
      expect(board.winning_combination?(:O)).to be_falsy
    end
    it 'return true with five horizontal continue piece' do
      board.add_piece([0, 0], :O)
      board.add_piece([0, 1], :O)
      board.add_piece([0, 2], :O)
      board.add_piece([0, 3], :O)
      board.add_piece([0, 4], :O)
      expect(board.winning_combination?(:O)).to be_truthy
    end
    it 'return true with five vertical continue piece' do
      board.add_piece([3, 3], :O)
      board.add_piece([4, 3], :O)
      board.add_piece([5, 3], :O)
      board.add_piece([6, 3], :O)
      board.add_piece([7, 3], :O)
      expect(board.winning_combination?(:O)).to be_truthy
    end
    it 'return true with five diagonal continue piece' do
      board.add_piece([7, 3], :O)
      board.add_piece([6, 4], :O)
      board.add_piece([5, 5], :O)
      board.add_piece([4, 6], :O)
      board.add_piece([3, 7], :O)
      expect(board.winning_combination?(:O)).to be_truthy
    end
  end

  describe '#full?' do
    it 'return false when the board is not full' do
      board.add_piece([7, 3], :O)
      board.add_piece([6, 4], :O)
      board.add_piece([5, 5], :O)
      board.add_piece([4, 6], :O)
      board.add_piece([3, 7], :O)
      expect(board.full?).to be_falsy
    end
    it 'return true when the board is full' do
      (0..9).each do |x|
        (0..9).each do |y|
          board.add_piece([x, y], :O)
        end
      end
      expect(board.full?).to be_truthy
    end
  end


end
