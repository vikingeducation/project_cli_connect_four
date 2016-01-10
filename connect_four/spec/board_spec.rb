require 'board'


describe Board do
  let(:a) {Board.new}
  let(:d) {Disk.make_player_1_disk}

  describe '#initialize' do
    it 'sets instance variable @board to empty_board' do
      expect(a.board).to eq(a.empty_board)
    end
  end

  describe '#place_disk' do
    it'places disk on left column' do
      test_board = a.board
      a.place_disk(d,0)
      expect(test_board[0][0]).to eq(d)
    end
  end

  describe '#check_connect_four' do
    it 'returns true on connect 4 condition' do
      test_array = [d, d, d, d]
      expect(a.check_connect_four?(test_array)).to eq(true)
    end

  end

  describe '#check_rows' do
    it 'checks for connect 4 along a row' do
      (0...4).each do |col|
        a.place_disk(d, col)
      end
      expect(a.check_rows).to eq(true)
    end
  end

  describe '#check_cols' do
    it 'checks for connect 4 along a col' do
      4.times { a.place_disk(d, 0) }
      expect(a.check_cols).to eq(true)
    end
  end

  describe '#check_diagonals' do
    it 'checks for connect 4 along a diag' do
      test_board = a.board
      (0..3).each do |coord|
        test_board[coord][coord] = d
      end
      a.board = test_board
      expect(a.check_diagonals).to eq(true)
    end
  end

  describe '#grid_full?' do
    it 'returns true on full board condition' do
      (0..6).each do |col|
        6.times { a.place_disk(d, col) }
      end
      expect(a.grid_full?).to eq(true)
    end
  end

  describe '#win_conditions?' do
    it 'returns true if check col is true' do
      4.times { a.place_disk(d, 0) }
      expect(a.win_conditions?).to eq(true)
    end
  end

  describe 'valid_move?' do
    it 'returns false if column is full' do
      6.times { a.place_disk(d, 0) }
      expect(a.valid_move?(1)).to eq(false)
    end

    it 'returns true if column has space' do
      expect(a.valid_move?(1)).to eq(true)
    end
  end
end
