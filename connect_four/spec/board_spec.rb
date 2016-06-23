# public methods: grid, cols, check_winner(col_idx, disk_inserted), full?
# private methods: count_4_dir, count
# test #initialize -  returns Board
# test #grid has array of Stacks
# test #cols - number of columns
# test #full?
# test #check_winner(col_idx, disk_inserted)
require 'pry'
require_relative '../lib/board'
describe Board do
  let(:board){ Board.new(6,7)}

  describe '#initialize' do
    it 'should give you a Board' do
      expect(board).to be_a(Board)
    end
  end

  describe '#grid' do
    it 'should arrays of Stacks' do
      expect(board.grid).to be_a(Array)
    end
    it 'should arrays of 6 Stacks' do
      expect(board.grid.size).to eq(6)
    end
    it 'should be arrays of Stack objects' do
      expect(board.grid.first).to be_a(Stack)
    end
    it 'should be arrays of Stack of size 7' do
      expect(board.grid.first.stack.size).to eq(7)
    end
  end

  describe '#cols' do
    it 'should return 7 cols' do
      expect(board.cols).to eq(6)
    end
  end

  describe '#full' do
    it 'should return true if board is full' do
      full_board = Board.new(4,4)
      (0..3).each do |stack_index|
        4.times { full_board.grid[stack_index].insert_disk('x') }
      end
      expect(full_board.full?).to be_truthy
    end
    it 'should return false if board is not full' do
      not_full_board = Board.new(4,4)
      (0..3).each do |stack_index|
        3.times { not_full_board.grid[stack_index].insert_disk('x') }
      end
      expect(not_full_board.full?).to be_falsey
    end
  end

  describe '#check_winner' do
    it 'should detect vertical winner' do
      4.times  { board.grid[0].insert_disk('x') }
      expect(board.check_winner(0, true, 'x')).to eq(true)
    end

    it 'should detect horizontal winner' do
      (0..3).each { |idx| board.grid[idx].insert_disk('x') }
      expect(board.check_winner(0, true, 'x')).to eq(true)
    end

    it 'should detect left diagonal winner' do
      3.times { board.grid[0].insert_disk('o') }
      board.grid[0].insert_disk('x')
      2.times { board.grid[1].insert_disk('o') }
      board.grid[1].insert_disk('x')
      board.grid[2].insert_disk('o')
      board.grid[2].insert_disk('x')
      board.grid[3].insert_disk('x')
      expect(board.check_winner(3, true, 'x')).to eq(true)
    end

    it 'should detect right diagonal winner' do
      board.grid[0].insert_disk('x')
      board.grid[1].insert_disk('o')
      board.grid[1].insert_disk('x')
      2.times { board.grid[2].insert_disk('o') }
      board.grid[2].insert_disk('x')
      3.times { board.grid[3].insert_disk('o') }
      board.grid[3].insert_disk('x')
      expect(board.check_winner(3, true, 'x')).to eq(true)
    end
  end
end