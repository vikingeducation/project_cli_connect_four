require "player.rb"
require "board.rb"

describe "ConnectFour Player class" do
  describe "#initialize(piece)" do
    it "should require a piece to initialize" do
      expect{ Player.new }.to raise_error(ArgumentError)
    end
    
    it "should have an accessible piece variable" do
      player = Player.new(:r)
      expect( player.piece ).to eq(:r)
    end
  end

  describe "Human class" do
    let(:player) { Human.new(:r) }
    let(:board) { Board.new }
    
    describe "#get_move(board)" do
      it "should get a valid move from the human player" do
        allow(player).to receive(:gets).and_return("1")
        expect( player.get_move(board) ).to be_nil
      end

      #it "should continually loop if the input is invalid"
      #it "should continually loop if the move is not possible"
    end
  end

  describe "AI class" do
    let(:player) { AI.new(:y) }

    it "should make a winning move when possible" do
      win_board = { 1 => [:y, :y, :y, nil, nil, nil],
                    2 => Array.new(6, nil),
                    3 => Array.new(6, nil),
                    4 => Array.new(6, nil),
                    5 => Array.new(6, nil),
                    6 => Array.new(6, nil),
                    7 => Array.new(6, nil) } 
      board = Board.new(win_board)
      player.get_move(board)
      expect( board.instance_variable_get( :@columns )[1][3] ).to eq(:y)
    end

    it "should make a blocking move when possible" do
      block_board = { 1 => [:r, :r, :r, nil, nil, nil],
                      2 => Array.new(6, nil),
                      3 => Array.new(6, nil),
                      4 => Array.new(6, nil),
                      5 => Array.new(6, nil),
                      6 => Array.new(6, nil),
                      7 => Array.new(6, nil) } 
      board = Board.new(block_board)
      player.get_move(board)
      expect( board.instance_variable_get( :@columns )[1][3] ).to eq(:y)
    end

    it "should prefer a winning move over a blocking move" do
      win_over_block = { 1 => [:r, :r, :r, nil, nil, nil],
                         2 => [:y, :y, :y, nil, nil, nil],
                         3 => Array.new(6, nil),
                         4 => Array.new(6, nil),
                         5 => Array.new(6, nil),
                         6 => Array.new(6, nil),
                         7 => Array.new(6, nil) } 
       board = Board.new(win_over_block)
       player.get_move(board)
       expect( board.instance_variable_get( :@columns )[2][3] ).to eq(:y)
    end

    #it "should make a random move if there is no winning or blocking move"
  end
end