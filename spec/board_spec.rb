require 'board'
=begin
1.  init empty board
2.  add_token
  empty column
  column with empty spaces
  full column
3. winning_combination
  none
  winning_diagonal
  winning_vertical
  winning_horizontal
4. full
  not full
  full
=end
describe Board do
  empty = {1 => Array.new(6),
                2 => Array.new(6),
                3 => Array.new(6),
                4 => Array.new(6),
                5 => Array.new(6),
                6 => Array.new(6),
                7 => Array.new(6)}
  full = {1 => Array.new(6, :r),
            2 => Array.new(6, :r),
            3 => Array.new(6, :r),
            4 => Array.new(6, :r),
            5 => Array.new(6, :r),
            6 => Array.new(6, :r),
            7 => Array.new(6, :r)}
  partially_full  = { 1 => [:r, nil, nil, nil, nil, nil],
                            2 => Array.new(6),
                            3 => [:r, nil, nil, nil, nil, nil],
                            4 => Array.new(6),
                            5 => [:r, nil, nil, nil, nil, nil],
                            6 => Array.new(6),
                            7 => [:r, nil, nil, nil, nil, nil]}
  diag = {1 => [:r, nil, nil, nil, nil, nil],
              2 => [nil, :r, nil, nil, nil, nil],
              3 => [nil, nil, :r, nil, nil, nil],
              4 => [nil, nil, nil, :r, nil, nil],
              5 => Array.new(6),
              6 => Array.new(6),
              7 => Array.new(6)}
  vert = {1 => [:r, :r, :r, :r, nil, nil],
              2 => Array.new(6),
              3 => Array.new(6),
              4 => Array.new(6),
              5 => Array.new(6),
              6 => Array.new(6),
              7 => Array.new(6)}
  horz = {1 => [:r, nil, nil, nil, nil, nil],
              2 => [:r, nil, nil, nil, nil, nil],
              3 => [:r, nil, nil, nil, nil, nil],
              4 => [:r, nil, nil, nil, nil, nil],
              5 => Array.new(6),
              6 => Array.new(6),
              7 => Array.new(6)}

  describe '#initialize' do
    it 'should give you a Board' do
      expect(Board.new.instance_variable_get( :@columns)).to eq(empty)
    end
  end

  describe '#add_token' do
    it 'should add token to empty board' do
      board = Board.new(empty)
      board.add_token(1, :r)
      compare_token = board.instance_variable_get(:@columns)[1][0]
      expect(compare_token).to eq(:r)
    end

    it 'should add token to partially full board' do
      board = Board.new(partially_full)
      board.add_token(1, :r)
      compare_token = board.instance_variable_get(:@columns)[1][1]
      expect(compare_token).to eq(:r)
    end

    it 'should not add a piece to a full column' do
      board = Board.new(full)
      expect{board.add_token(1, :r)}.to output("That column is full.\n").to_stdout
    end
  end

  describe '#winning_combination' do
    it 'should return false if there is no winnging comination' do
      board = Board.new(partially_full)
      expect(board.winning_combination?(:r)).to be false
    end
    it 'should return true if there is a diagonal winning combination' do
      board = Board.new(diag)
      expect(board.winning_combination?(:r)).to be true
    end
    it 'should return true if there is a vertical winning combination' do
      board = Board.new(vert)
      expect(board.winning_combination?(:r)).to be true
    end
    it 'should return true if there is a horizontal winning combination' do
      board = Board.new(horz)
      expect(board.winning_combination?(:r)).to be true
    end


  end

  describe '#full' do
    it 'should return false if the board is not full' do
      board = Board.new(partially_full)
      expect(board.full?).to be false
    end
    it 'should return true if the board is full' do
      board = Board.new(full)
      expect(board.full?).to be true
    end
  end

end
