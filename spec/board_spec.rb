require 'board'

describe Board do
  let(:board) { Board.new }
  let(:board_grid) { board.instance_variable_get( :@board ) }     

  describe "#initialize" do

    it "creates an instance of board" do
      expect(board).to be_an_instance_of(Board)
    end

    it "creates a board with 7 columns" do
      col_count = board_grid.length
      expect(col_count).to eq(7)
    end

    it "when board is initialized, columns are empty" do
      expect(board_grid.all?(&:empty?)).to eq(true)
    end
  end

  describe "#add_piece" do
    before(:each) do
      board.add_piece('r',0)
    end


    it "adds the correct color piece in the correct spot" do
      expect(board_grid.first[0]).to eq('r')
    end

    it "only adds to the correct spot" do
      board_size = board_grid.reduce(0) do |piece_total,col|
        piece_total + col.length
      end
      expect(board_size).to eq(1)
    end

    it "returns false if the column is full" do

      5.times do
        board.add_piece('r', 0)
      end

      expect(board.add_piece('r', 0)).to eq(false)

    end 
  end

  describe "#win" do

    it "returns true if there are four consecutive pieces in a column" do
      4.times do
        board.add_piece('r', 0)
      end

      expect(board.win?).to eq(true)
    end
    
    it "returns true if there are four consecutive pieces in a row" do
      (0..3).each do |col|
        board.add_piece('r', col)
      end

      expect(board.win?).to eq(true)
    end
    
    #when you win vertically win returns true
    it "returns false if there are no four consecutive pieces" do
      (0..6).each do |col|
        6.times do
      
          if col.even?
            board.add_piece('r', col)
            board.add_piece('b', col)
          else
            board.add_piece('b', col)
            board.add_piece('r', col)
          end

        end
      end

      expect(board.win?).to eq(false)

    end


  end

end