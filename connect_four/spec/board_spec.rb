load 'lib/board.rb'

=begin
  initialize
  add_piece
=end

describe 'Board' do
  let(:b){ Board.new }
  let(:test_board){[["o"," "," "," "," "," "," "],
                   ["o"," "," "," "," "," "," "],
                   ["o"," "," "," "," "," "," "],
                   ["o"," "," "," "," "," "," "],
                   ["o"," "," "," "," "," "," "],
                   ["o","o","o","o","o","o","o"]]}

  describe '#get_row' do
    xit 'will return the first empty row given a column' do
      expect(b.get_row([1,2,3])).to eq(2)
    end
  end

  describe '#valid_drop?' do
    it 'will tell you a column is full' do
      expect(Board.new(test_board).valid_drop?(1)).to be(false)
    end

    it 'will tell you you are out of bounds' do
      expect(b.in_bounds?(12)).to be(false)
    end

    it 'will tell you you are in bounds' do
      expect(b.in_bounds?(3)).to be(true)
    end
  end

  describe '#player_array' do
    let(:player_red){ Player.new('red') }
    let(:player_blue){ Player.new('blue') }

    it 'will return an empty array for player red' do
      expect(Board.new.player_array(player_red)).to eq([])
    end

    it 'will return an empty array for player blue' do
      expect(Board.new.player_array(player_blue)).to eq([])
    end

  end

  describe '#vertical_combos' do
    let(:vert_combinations){[[0, 4],[0, 3],[0, 2],[0, 1]]}

    it 'will return :vert_combinations when called using [0,4]' do
      expect(Board.new.vertical_combos([0,4])).to eq(vert_combinations)
    end
  end

  describe '#horizontal_combos' do
    let(:hor_combinations){[[[0, 3], [1, 3], [2, 3], [3, 3]], 
                            [[1, 3], [2, 3], [3, 3], [4, 3]], 
                            [[2, 3], [3, 3], [4, 3], [5, 3]], 
                            [[3, 3], [4, 3], [5, 3], [6, 3]]]}

    it 'will return :hor_combinations when called using [3,3]' do
      expect(Board.new.horizontal_combos([3,3])).to eq(hor_combinations)
    end

  end

end
