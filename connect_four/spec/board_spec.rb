load 'lib/board.rb'

=begin
  initialize
  add_piece
=end

describe 'Board' do
  describe '#initialize' do
    
    it 'raises an error when arguments are passed to initialize' do
      expect do
        Board.new(1)
      end.to raise_error(ArgumentError)
    end

  end
end