require 'board'
require 'players'

describe Board do
  before{ allow(STDOUT).to receive(:puts) }

  let(:b){Board.new}
  let(:filled){ Board.new([['o', 'x', 'o'], ['o', 'x'], ['o', 'x'], ['o'], [], [], []])}
  let(:full){Board.new([ [1, 1, 1, 1, 1, 1],
                         [1, 1, 1, 1, 1, 1],
                         [1, 1, 1, 1, 1, 1],
                         [1, 1, 1, 1, 1, 1],
                         [1, 1, 1, 1, 1, 1],
                         [1, 1, 1, 1, 1, 1],
                         [1, 1, 1, 1, 1, 1],
                         [1, 1, 1, 1, 1, 1],
                         ]
                       )}

  describe "#initialize" do

    it "should be a Board" do
      expect(b).to be_a(Board)
    end

    it "should have an array of 7 arrays" do
      expect(b.board).to eq([[], [], [], [], [], [], []])
    end

    it "accepts an argument" do
      expect{filled}.not_to raise_error
    end

    it "stores passed in board in instance variable" do
      expect(filled.board).to eq([['o', 'x', 'o'], ['o', 'x'], ['o', 'x'], ['o'], [], [], []])
    end
  end

  #render (unnecessary)

  describe "#full?" do
    it "returns true if board is full" do

      expect(full.full?).to eq(true)
    end
    it "returns false if board is not full" do
      almost = Board.new( [ [1, 1, 1, 1, 1, 1],
                            [1, 1, 1, 1, 1],
                            [1, 1, 1, 1, 1, 1],
                            [1, 1, 1, 1, 1, 1],
                            [1, 1, 1, 1, 1, 1],
                            [1, 1, 1, 1, 1, 1],
                            [1, 1, 1, 1, 1, 1],
                            [1, 1, 1, 1, 1, 1],
                            ])
      expect(almost.full?).to eq(false)
      expect(b.full?).to eq(false)
    end
  end

  describe "#update" do

    let(:player){ Human.new }

    it "adds player piece to correct column" do
      allow(player).to receive(:gets).and_return("4")
      player.get_move(b)
      b.update(player)
      expect(b.board).to eq([ [], [], [], ['o'], [], [], []])
    end

    it "adds player piece to a middle column" do
      allow(player).to receive(:gets).and_return("7")
      player.get_move(b)
      b.update(player)
      expect(b.board).to eq([ [], [], [], [], [], [], ['o']])
    end

    it "adds player piece to the last column" do
      allow(player).to receive(:gets).and_return("1")
      player.get_move(b)
      b.update(player)
      expect(b.board).to eq([ ['o'], [], [], [], [], [], []])
    end
  end

  #valid_move?
  describe "#valid_move?" do

    it "returns false if move is a valid number in board" do
      expect(b.valid_move?(7)).to eq(false)
      expect(b.valid_move?(-1)).to eq(false)
    end

    it "returns true if move is a valid column number" do
      expect(b.valid_move?(4)).to eq(true)
      expect(b.valid_move?(0)).to eq(true)
      expect(b.valid_move?(6)).to eq(true)
    end

    it "returns false if col is full" do
      expect(full.valid_move?(3)).to eq(false)
      expect(full.valid_move?(6)).to eq(false)
      expect(full.valid_move?(0)).to eq(false)
    end
  end


  describe "#game_won?" do
    # do this after connect_four
    it "returns true if connects four diagonally" do
      d1 = Board.new([
                       [2, 2, 2, 2, 1],
                       [2, 2, 2, 1],
                       [2, 2, 1, 2, 2],
                       [2, 1],
                       [],
                       [],
                       [],
                     ]
                     )
      d2 = Board.new([
                       [1, 1, 1, 1, 1],
                       [1, 1, 1, 1],
                       [2, 3, 4, 2, 2],
                       [2, 1, 3],
                       [1, 6, 4, 3],
                       [0, 9, 2, 3, 3],
                       [],
                     ]
                     )
      expect(d1.game_won?).to eq(true)
      expect(d2.game_won?).to eq(true)
    end
    it "returns true if connects four horizontally" do
      h1 = Board.new([
                       [0, 1],
                       [2, 1],
                       [0, 1],
                       [0, 1],
                       [],
                       [],
                       []
                     ]
                     )
      expect(h1.game_won?).to eq(true)
    end
    it "returns true if connects four vertically" do
      v = Board.new([
                      [],
                      [],
                      [],
                      [],
                      [],
                      [],
                      [0, 1, 1, 1, 1]
      ])
      expect(v.game_won?).to eq(true)
    end
    it "returns false if no connect fours" do
      no = Board.new([
                       [1, 2],
                       [0, 3],
                       [],
                       [1, 2, 3, 4],
                       [3],
                       [4],
                       [3]
      ])
      expect(no.game_won?).to eq(false)
    end
  end

end
