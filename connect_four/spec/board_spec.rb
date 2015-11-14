require_relative '../lib/board.rb'

describe 'Board' do

  let(:board){Board.new}

  describe '#initialize' do

    it 'should give you a board' do
      expect(board).to be_a(Board)
    end

    it 'should have an empty hash of moves' do
      expect(board.columns).to eq({0 => [], 1 => [], 2 => [], 3 => [], 4 => [],5 => [], 6 => []})
    end
  end

  describe '#place_move' do

    it 'should raise an argument error if 2 arguments not given' do
      expect{ board.place_move }.to raise_error(ArgumentError)
    end

    it 'should add a valid move to the board' do
      board.place_move(4, 'o')
      expect(board.columns[3].last).to eq('o')
    end

    it 'should return true when move added to board' do
      expect(board.place_move(1, 'o')).to eq(true)
    end

    it 'should not add an invalid move to the board' do
      7.times { board.place_move(5, 'o') }
      expect(board.columns[4].size).to eq(6)
    end

    it 'should return false when move not added to board' do
      6.times { board.place_move(5, 'o') }
      expect(board.place_move(5, 'o')).to eq(false)
    end
  end

  describe '#winning_combination?' do

    it 'should raise an argument error if an argument is not given' do
      expect{ board.winning_combination? }.to raise_error(ArgumentError)
    end

    it 'should return a win when have 4-in-a-row vertically' do
      columns = {0 => ['o','o','o','o'], 1 => [], 2 => [], 3 => [], 4 => [],5 => [], 6 => []}
      expect(board.winning_combination?('o', columns)).to eq(true)
    end

    it 'should return a win when have 4-in-a-row horizontally' do
      columns = {0 => ['o'], 1 => ['o'], 2 => ['o'], 3 => ['o'], 4 => [],5 => [], 6 => []}
      expect(board.winning_combination?('o', columns)).to eq(true)
    end

    it 'should return a win when have 4-in-a-row diagonally' do
      columns = {0 => ['o'], 1 => ['x', 'o'], 2 => ['x', 'x', 'o'], 3 => ['x', 'x', 'x', 'o'], 4 => [],5 => [], 6 => []}
      expect(board.winning_combination?('o', columns)).to eq(true)
    end

    it 'should not return a win when no wins present' do
      expect(board.winning_combination?('o')).to eq(false)
    end
  end

  describe '#full?' do

    it 'should return true if board full' do
      (1..7).each do |move|
        6.times { board.place_move(move, 'o') }
      end
      expect(board.full?).to eq(true)
    end

    it 'should return false if board not full' do
      expect(board.full?).to eq(false)
    end
  end

  describe '#spot_open?' do

    it 'should return true if a spot is open' do
      expect(board.spot_open?(4)).to eq(true)
    end

    it 'should return false if a column is full' do
      6.times { board.place_move(2, 'o') }
      expect(board.spot_open?(1)).to eq(false)
    end

    it 'should raise argument error if no column given' do
      expect{board.spot_open?}.to raise_error(ArgumentError)
    end

  end

end