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
    let(:combinations){[[0, 4],[0, 3],[0, 2],[0, 1]]}

    it 'will return :combinations when called using [0,4]' do
      expect(Board.new.vertical_combos([0,4])).to eq(combinations)
    end
  end

end
