require 'board'

=begin







  check_rows?
    - check to see if non-winning conditions return false
    - check to see if winning conditions return true

  check_up_diagonals?
    - check to see if non-winning conditions return false
    - check to see if winning conditions return true

  check_down_diagonals?
    - check to see if non-winning conditions return false
    - check to see if winning conditions return true    

  check_array_for_match
    - return true if all items in array match piece
    - return false if any item in array does not match piece

=end



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
      expect(b.send(:check_columns?, "X")).to be false
    end

    it 'returns true for winning condition' do

      expect(b.send(:check_columns?, "X")).to be true
    end
  end


 # check_columns?
 #    - check to see if non-winning conditions return false
 #    - check to see if winning conditions return true














end