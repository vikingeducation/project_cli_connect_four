require 'board'

=begin



  available?
    - check to see if a full column rejects a new piece
    - check to see if a non-full column accepts a new piece

  check_columns?
    - check to see if non-winning conditions return false
    - check to see if winning conditions return true

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
      board
    end

  end


    # tie?
    # - check to see if a board of all X's returns true
    # - check to see if starting board returns false















end