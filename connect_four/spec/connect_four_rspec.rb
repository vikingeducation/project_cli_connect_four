require 'connect_four'
describe C4_space do
  describe '#initialize' do
    it 'creates an empty space' do
      expect{C4_space.new}.not_to raise_error
    end
  end

  describe '#set_state' do
    it 'sets a space state correctly' do
      space = C4_space.new
      expect{space.set(:blue)}.to raise_error("C4_space class: your disc wasn't either :blue or :yellow, missed any : ?")
    end

    it 'returns false when trying to fill an already filled space' do
      space = C4_space.new
      space.set(:yellow)
      expect(space.set(:red)).to eq(false)
    end
  end
end


describe C4_board do
  describe '#initialize' do
    it 'creates an array of C4_spaces' do
      board = C4_board.new
      expect(board.space(1,1)).to be_a(C4_space)
    end

    it 'sets a space in the board correctly' do
      board = C4_board.new
      board.set(1,1,:red)
      expect(board.space(1,1).state).to eq(:red)
    end

    it 'reports a column as full' do
      board = C4_board.new
      6.times {board.drop(1,:red)}
      expect(board.column_full?(1)).to eq(true)
    end

    it 'returns false when trying to drop on a full column' do
      board = C4_board.new
      6.times {board.drop(1,:red)}
      expect(board.drop(1,:yellow)).to eq(false)
    end

    it 'finds a winning column' do
      board = C4_board.new
      4.times {board.drop(3,:red)}
      expect(board.column_win?(:red)).to eq(true)
    end

    it 'finds a winning row' do
      board = C4_board.new
      i = 0
      4.times {
        i += 1
        board.drop(i,:red)}
      expect(board.row_win?(:red)).to eq(true)
    end

    it 'doesnot find a winning diagonal' do
      board = C4_board.new
      i = 0
      4.times {
        i += 1
        board.drop(i,:red)}
      expect(board.f_diagonal_win?(:red)).to eq(nil)
    end
  end
end
