require 'board'

describe Board do

  let(:b){Board.new}

  describe '#initialize' do
    
    it 'has 7 columns' do
      expect(b.board.size).to eq(7)
    end

    it 'has 6 rows in each column' do
      expect(b.board.map{|column| column.size}).to eq([6,6,6,6,6,6,6])
    end

    it 'starts with every cell as an "_" ' do
      expect(b.board.flatten.all? {|item| item == "_"}).to be true
    end

  end

  describe '#tie?' do

    it 'returns true if the board is full of pieces' do
      b.instance_variable_set( :@board, Array.new(7) { Array.new(6, "X") } )
      expect(b.tie?).to be true
    end

    it 'returns false for starting board' do
      expect(b.tie?).to be false
    end

    it 'returns false for one "_"' do
      b.instance_variable_set( :@board, [["X","_"],["X","X"]] )
      expect(b.tie?).to be false
    end
  end

  describe '#available?' do

    it 'rejects new piece if column is full' do
      b.instance_variable_set( :@board, Array.new(7) { Array.new(6, "X") } )
      expect(b.send(:available?, [4,"X"])).to be false
    end

    it 'accepts new piece for non-full column' do
      expect(b.send(:available?, [4,"X"])).to be true
    end

  end

  describe '#check_columns?' do

    it 'returns false for non-winning condition' do
      new_board = [["X", "O", "X", "O", "X", "O"], 
                   ["O", "X", "O", "X", "O", "X"], 
                   ["X", "X", "X", "O", "X", "O"], 
                   ["O", "X", "O", "X", "O", "X"],  
                   ["X", "O", "X", "X", "X", "O"], 
                   ["O", "X", "O", "O", "O", "X"],  
                   ["X", "O", "X", "X", "X", "O"]]
      b.instance_variable_set( :@board, new_board)
      expect(b.send(:check_columns?, "X")).to be false
    end

    it 'returns true for winning condition' do
      new_board = [["X", "O", "X", "O", "X", "O"], 
                   ["O", "X", "X", "X", "X", "O"], 
                   ["X", "X", "X", "O", "X", "O"], 
                   ["O", "X", "O", "X", "O", "X"],  
                   ["X", "O", "X", "X", "X", "O"], 
                   ["O", "X", "O", "O", "O", "X"],  
                   ["X", "O", "X", "X", "X", "O"]]
      b.instance_variable_set( :@board, new_board)
      expect(b.send(:check_columns?, "X")).to be true
    end
  
  end

  describe '#check_rows?' do

    it 'returns false for non-winning condition' do
      new_board = [["X", "O", "X", "O", "X", "O"], 
                   ["O", "X", "O", "X", "O", "X"], 
                   ["X", "X", "X", "O", "X", "O"], 
                   ["O", "X", "O", "X", "O", "X"],  
                   ["X", "O", "X", "X", "X", "O"], 
                   ["O", "X", "O", "O", "O", "X"],  
                   ["X", "O", "X", "X", "X", "O"]]
      b.instance_variable_set( :@board, new_board)
      expect(b.send(:check_rows?, "X")).to be false
    end

    it 'returns true for winning condition' do
      new_board = [["X", "O", "X", "O", "X", "O"], 
                   ["O", "X", "X", "O", "X", "O"], 
                   ["X", "X", "X", "O", "X", "O"], 
                   ["O", "X", "O", "O", "O", "X"],  
                   ["X", "O", "X", "X", "X", "O"], 
                   ["O", "X", "O", "O", "O", "X"],  
                   ["X", "O", "X", "X", "X", "O"]]
      b.instance_variable_set( :@board, new_board)
      expect(b.send(:check_rows?, "O")).to be true
    end
  end

  describe '#check_up_diagonals?' do

    it 'returns false for non-winning condition' do
      new_board = [["X", "O", "O", "O", "X", "O"], 
                   ["O", "X", "X", "X", "O", "X"], 
                   ["X", "X", "X", "X", "X", "O"], 
                   ["O", "X", "O", "X", "O", "X"],  
                   ["X", "O", "X", "X", "X", "O"], 
                   ["O", "X", "O", "O", "O", "X"],  
                   ["X", "O", "X", "X", "X", "O"]]
      b.instance_variable_set( :@board, new_board)
      expect(b.send(:check_up_diagonals?, "O")).to be false
    end

    it 'returns true for winning condition' do
      new_board = [["X", "O", "X", "O", "X", "O"], 
                   ["O", "X", "X", "O", "X", "O"], 
                   ["X", "X", "X", "O", "X", "O"], 
                   ["O", "X", "O", "X", "O", "X"],  
                   ["X", "O", "X", "X", "O", "O"], 
                   ["O", "X", "O", "O", "O", "X"],  
                   ["X", "O", "X", "X", "X", "O"]]
      b.instance_variable_set( :@board, new_board)
      expect(b.send(:check_up_diagonals?, "X")).to be true
    end
  end

  describe '#check_down_diagonals?' do

    it 'returns false for non-winning condition' do
      new_board = [["X", "O", "O", "O", "X", "O"], 
                   ["O", "X", "X", "X", "O", "X"], 
                   ["X", "X", "X", "X", "X", "O"], 
                   ["O", "X", "O", "X", "O", "X"],  
                   ["X", "O", "X", "X", "X", "O"], 
                   ["O", "X", "O", "O", "O", "X"],  
                   ["X", "O", "X", "X", "X", "O"]]
      b.instance_variable_set( :@board, new_board)
      expect(b.send(:check_down_diagonals?, "O")).to be false
    end

    it 'returns true for winning condition' do
      new_board = [["X", "O", "X", "O", "X", "O"], 
                   ["O", "X", "X", "X", "X", "O"], 
                   ["X", "X", "X", "O", "X", "O"], 
                   ["O", "X", "O", "X", "O", "X"],  
                   ["O", "O", "O", "X", "O", "O"], 
                   ["O", "X", "O", "O", "O", "X"],  
                   ["X", "O", "X", "X", "X", "O"]]
      b.instance_variable_set( :@board, new_board)
      expect(b.send(:check_down_diagonals?, "X")).to be true
    end
  end

  describe '#check_array_for_match' do

    it 'returns true if all items in array match piece' do
      expect(b.send(:check_array_for_match, [1,1,1,1], 1)).to be true
    end

    it 'returns false if any item in array does not match piece' do
      expect(b.send(:check_array_for_match, [1,1,2,1], 1)).to be false
    end

  end

  describe '#receive_move?' do

    it 'returns true if move is available' do
      expect(b.receive_move?([1,"X"])).to be true
    end

    it 'returns false if move is unavailable' do
      new_board = [["X", "O", "X", "O", "X", "O"], 
                   ["O", "X", "X", "X", "X", "O"], 
                   ["X", "X", "X", "O", "X", "O"], 
                   ["O", "X", "O", "X", "O", "X"],  
                   ["O", "O", "O", "X", "O", "O"], 
                   ["O", "X", "O", "O", "O", "X"],  
                   ["X", "O", "X", "X", "X", "O"]]
      b.instance_variable_set( :@board, new_board)
      expect(b.receive_move?([3,"X"])).to be false
    end

  end

  describe '#check_winner?' do

    it 'will return false if no win condition exists on board' do
      new_board = [["X", "O", "O", "O", "X", "O"], 
                   ["O", "X", "X", "X", "O", "X"], 
                   ["X", "X", "O", "O", "X", "O"], 
                   ["O", "X", "X", "O", "O", "X"],  
                   ["X", "O", "X", "X", "X", "O"], 
                   ["O", "X", "O", "O", "O", "X"],  
                   ["X", "O", "X", "X", "X", "O"]]
      b.instance_variable_set(:@board, new_board)
      expect(b.check_winner?("X")).to be false
    end

    it "will return false if win condition for 'O' but check for 'X'" do
      new_board = [["X", "O", "O", "O", "X", "O"], 
                   ["O", "X", "X", "X", "O", "X"], 
                   ["X", "X", "O", "O", "X", "O"], 
                   ["O", "X", "O", "O", "O", "X"],  
                   ["X", "O", "X", "X", "X", "O"], 
                   ["O", "X", "O", "O", "O", "X"],  
                   ["X", "O", "X", "X", "X", "O"]]
      b.instance_variable_set(:@board, new_board)
      expect(b.check_winner?("X")).to be false
    end

    it 'will return true for win condition' do
      new_board = [["X", "O", "X", "O", "X", "O"], 
                   ["O", "X", "X", "X", "X", "O"], 
                   ["X", "X", "X", "O", "X", "O"], 
                   ["O", "X", "O", "X", "O", "X"],  
                   ["O", "O", "O", "X", "O", "O"], 
                   ["O", "X", "O", "O", "O", "X"],  
                   ["X", "O", "X", "X", "X", "O"]]
      b.instance_variable_set( :@board, new_board)
      expect(b.check_winner?("X")).to be true
    end

  end

end