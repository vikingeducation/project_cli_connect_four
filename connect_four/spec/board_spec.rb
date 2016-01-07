require 'board'


describe Board do

  let( :board ) { Board.new }

  empty_board = [
                  [nil, nil, nil, nil, nil, nil, nil], 
                  [nil, nil, nil, nil, nil, nil, nil], 
                  [nil, nil, nil, nil, nil, nil, nil], 
                  [nil, nil, nil, nil, nil, nil, nil], 
                  [nil, nil, nil, nil, nil, nil, nil], 
                  [nil, nil, nil, nil, nil, nil, nil]
              ]

  forward_diagonal_victory = [
                  [nil, nil, nil, nil, nil, nil, nil],
                  [nil, nil, nil, nil, nil, nil, nil],
                  [nil, nil, nil, "R", nil, nil, nil],
                  [nil, nil, "R", "G", nil, nil, nil],
                  [nil, "R", "G", "G", nil, nil, nil],
                  ["R", "G", "G", "G", nil, nil, nil],
                ]




  describe '#attr_accessor' do
    it "responds to :game_board attribute" do
      expect(board).to respond_to :game_board
    end
  end


  describe "initialize" do
    it "makes an empty gameboard" do
      expect(board.game_board).to be_an_instance_of(Array)
      expect(board.check_board_empty?).to be true
    end

  end






end