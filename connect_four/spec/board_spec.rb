require "board"

describe Board do 

  let (:b) {Board.new}
  
  describe "#initialize" do
    it "should save a new 6 X 7 board to @board when a new Board is created" do 
      expect(b.board).to eq(Array.new(6) {Array.new(7)})
    end

    it "should raise an argument error when you passing in one or more arguments" do
      expect{Board.new(1)}.to raise_error(ArgumentError)
    end
  end

  describe "#horizontal_win?" do 
    describe "4 in a row" do 
      before do 
        4.times{ |i| b.board[5][i] = :X }
      end

      it "should return true if there are 4 identical player pieces in a row" do 
        expect(b.horizontal_win?(:X, 0)).to be true
      end

      it "should return true if the winning piece is in between the other 3 pieces" do 
        expect(b.horizontal_win?(:X, 2)).to be true
      end
    end   

    describe "a gap or opponent's piece blocking" do 
      before do 
        5.times { |i| b.board[5][i] = :X }
      end

      it "should return false if there are 4 identical player pieces and 1 opponent's piece in between" do 
        b.board[5][3] = :O
        expect(b.horizontal_win?(:X,0)).to be false
      end
      
      it "should return false if there are 4 identical player pieces and nil is in between" do 
        b.board[5][3] = nil
        expect(b.horizontal_win?(:X, 0)).to be false
      end
    end  

    it "should return false if there are fewer than 4 identical player pieces in a row" do 
      3.times { |i| b.board[5][i] = :X }
      expect(b.horizontal_win?(:X, 0)).to be false
    end
  end

  describe "#vertical_win?" do
    it "should return true if there are 4 identical player pieces next lined up in a column" do 
      4.times { |i| b.board[i][0] = :X }
      expect(b.vertical_win?(:X, 0)).to be true
    end

    it "should return false if there are fewer than 4 identical player pieces lined up in a column" do 
      3.times { |i| b.board[i][0] = :X }
      expect(b.vertical_win?(:X, 0)).to be false
    end

    it "should return false if there are 4 identical player pieces and 1 opponent's piece in between" do
      5.times { |i| b.board[i][0] = :X}
      b.board[3][0] = :O
      expect(b.vertical_win?(:X, 0)).to be false
    end
  end

  describe "#diagonal_win?" do 
    describe "positively sloping diagonal" do 
      before do 
        4.times { |i| b.board[5 - i][0 + i] = :X }
      end

      it "should return true if there are 4 identical player pieces making a positively sloping diagonal" do 
        expect(b.diagonal_win?(:X, 0)).to be true
      end

      it "should return true if the winning piece is in between the other 3 pieces" do 
        b.board[5][1] = :O
        expect(b.diagonal_win?(:X, 1)).to be true
      end

      it "should return false if there is an opponent's piece in between the current player's piece" do 
        b.board[4][1] = :O
        expect(b.diagonal_win?(:X, 0)).to be false
      end       
    end 
   
    it "should return true if there are 4 identical player pieces making a negatively sloping diagonal" do 
      4.times { |i| b.board[5 - i][6 - i] = :X }
      expect(b.diagonal_win?(:X, 6)).to be true
    end

    it "should return false if there are fewer than 4 identical player pieces diagonally" do 
      3.times { |i| b.board[5 - i] [0 + i] = :X } 
      expect(b.diagonal_win?(:X, 0)).to be false
    end
  end  
end







