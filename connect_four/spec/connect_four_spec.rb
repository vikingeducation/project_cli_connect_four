require "connect_four"

describe ConnectFour do 

  let (:c) { ConnectFour.new}

  describe "#initialize" do 

    it "should create a new Board object stored in @board" do 
      expect(c.board).to be_an_instance_of(Board)
    end

    it "should create a new player1 stored in @player1" do 
      expect(c.instance_variable_get(:@player1)).to be_an_instance_of(Player)
    end

    it "should create a new player2 stored in @player2" do 
      expect(c.instance_variable_get(:@player2)).to be_an_instance_of(Player)
    end

    it "should raise an argument error if 1 or more inputs are passed" do 
      expect{ConnectFour.new(1)}.to raise_error(ArgumentError)
    end

    it "should set current_player to player1" do 
      expect(c.current_player).to eq(c.instance_variable_get(:@player1))
    end

  end

  describe "#play_again?" do 

    it "should return true if input is 'y'" do 
      allow(c).to receive(:gets).and_return("y")
      expect(c.play_again?).to be true
    end

    it "should return false if input is 'n'" do 
      allow(c).to receive(:gets).and_return("n")
      expect(c.play_again?).to be false
    end

  end

  describe "#board_full?" do 

    it "should return true if all of the top rows are full" do 
      7.times { |i| c.board.board[0][i] = :X }
      expect(c.board_full?).to be true
    end

    it "should return false if all of the top rows are not full" do 
      6.times { |i| c.board.board[0][i] = :X }
      expect(c.board_full?).to be false
    end

  end

  describe "#col_full?" do 

    it "should return true if the top row has a player's piece" do 
      c.board.board[0][0] = :X
      expect(c.col_full?(0)).to be true
    end

    it "should return false if the top row does not have a player's piece" do 
      c.board.board[1][0] = :X
      expect(c.col_full?(0)).to be false
    end

  end

  describe "#switch_players" do 
    
    it "should set the current_player to player2 if current_player is player1" do 
      expect(c.switch_players).to eq(c.instance_variable_get(:@player2))
    end

    it "should set the current_player to player1 if current_player is player2" do 
      c.instance_variable_set(:@current_player, :@player2)
      expect(c.switch_players).to eq(c.instance_variable_get(:@player1))
    end

  end

  describe "#move_piece" do 

    it "should move the piece to the bottom row if column is empty" do 
      c.move_piece(3)
      expect(c.board.board[5][3]).to eq(:X)
    end

    it "should move the piece on top of another piece" do 
      c.move_piece(2)
      c.switch_players
      c.move_piece(2)
      expect(c.board.board[4][2]).to eq(:O)
    end

  end

  describe "#announce_player" do 

    it "should say 'Player 1's turn:' if current_player is player1" do
      expect(STDOUT).to receive(:puts).with("Player 1's turn:")
      c.announce_player
    end

    it "should say 'Player 2's turn:' if current_player is player2" do 
      expect(STDOUT).to receive(:puts).with("Player 2's turn:")
      c.switch_players
      c.announce_player
    end

  end

  describe "#announce_winner" do 

    it "should say 'You win, Player 1!' if current_player is player1" do 
      expect(STDOUT).to receive(:puts).with("You win, Player 1!")
      c.announce_winner
    end

    it "should say 'You win, Player 2!' if current_player is player2" do
      expect(STDOUT).to receive(:puts).with("You win, Player 2!")
      c.switch_players
      c.announce_winner
    end

  end

end







