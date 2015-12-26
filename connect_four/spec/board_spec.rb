require 'board'

describe Board do
  let(:board){ Board.new }

  describe '#initialize' do

    it 'should give you a Board' do
      expect(board).to be_a(Board)
    end

    it 'should set up seven arrays with 6 spots in them each' do
      initial_grid = []
      7.times {initial_grid << [' ', ' ', ' ', ' ', ' ', ' ']}
      expect(board.grid).to eq(initial_grid)
    end

    it 'should have a winning move which is nil' do
      expect(board.winning_move).to eq(nil)
    end

    it 'should set the answer as an empty array by default' do
      expect(board.instance_variable_get(:@answer)).to eq([])
    end

  end

  describe '#add_piece_to_board' do

    # Bad Path
    it 'should raise an error if two arguments arent given' do
      expect{ board.add_piece_to_board }.to raise_error(ArgumentError)
    end

    # Happy Path
    it 'should pass if first argument is an integer and second argument is a string' do
      board.add_piece_to_board(3, 'x')
    end

    # Bad Path
    it "should raise an error if first arguments isn't a integer" do
      expect{ board.add_piece_to_board("x", "x") }.to raise_error(NoMethodError)
    end

    it 'should replace the space with the piece in a chosen column if there is a space.' do
      board.add_piece_to_board(1,'x')

      expect(board.grid[0][0]).to eq('x')
    end

  end

  # Public Input
  # I don't think we need to test the column input because the validity of that input is checked in other methods.
  # Output
  # => I think we want to test if it checks the grid for a space and gives a true response if there is space and also if there isn't space, that it'll return a false answer.
  describe '#does_column_have_space?' do
    it 'should return true if column of grid does have space' do
      expect(board.does_column_have_space?(1)).to eq(true)
    end

    it 'should return false if column does not have space' do
      board.grid = [['x'],['x']]
      expect(board.does_column_have_space?(1)).to eq(false)
    end

  end

  # Told not to worry about render methods but I wanted to test that it calls the render_current_board method.
  describe '#render' do
    it 'calls the render_current_board method' do
      allow(board).to receive(:render_current_board)
      expect(board).to receive(:render_current_board)
      board.render
    end
  end

  # Public Input
  # => Don't really need to worry about the piece argument because that is set in other other classes.
  # Output etc
  # want to make sure it calls the set_answer method.
  # want to make sure it calls the vertical_winner? method
  # want to make sure it calls the horizontal_win? method
  # want to make sure it calls the diagonal_win? method
  describe '#winner?' do

    it 'should raise an error if one argument is not given' do
      expect{ board.winner? }.to raise_error(ArgumentError)
    end

    # want to make sure it calls the set_answer method.
    it 'calls the set_answer method' do
      allow(board).to receive(:set_answer)
      expect(board).to receive(:set_answer)
      board.winner?("x")
    end

    # set_answer? sets the answer depending on the piece given
    describe '#set_answer' do
      it 'sets the answer depending on the argument given' do
        board.winner?("z")
        expect(board.instance_variable_get(:@answer)).to eq(["z","z","z","z"])
      end
    end

    # want to make sure it calls the vertical_winner? method
    it 'calls the vertical_win? method' do
      allow(board).to receive(:vertical_win?).and_return(true)
      expect(board).to receive(:vertical_win?)
      board.winner?("x")
    end

=begin
    describe '#vertical_win?' do
      it 'returns false if there is no vertical win move' do
        expect(board).to receive(:vertical_win?).with([' ',' ',' ',' ',' ',' ']).and_return(false)
        board.winner?("x")
      end
    end
=end

    # want to make sure it calls the horizontal_win? method
    it 'calls the horizontal_win? method' do
      allow(board).to receive(:vertical_win?).and_return(false)
      allow(board).to receive(:horizontal_win?).and_return(true)
      expect(board).to receive(:horizontal_win?)
      board.winner?("x")
    end

    # want to make sure it calls the diagonal_win? method
    it 'calls the diagonal_win? method' do
      allow(board).to receive(:vertical_win?).and_return(false)
      allow(board).to receive(:horizontal_win?).and_return(false)
      allow(board).to receive(:diagonal_win?).and_return(true)
      expect(board).to receive(:diagonal_win?)
      board.winner?("x")
    end

    # returns false if all other options are false
    it 'calls false if all other options are false' do
      allow(board).to receive(:vertical_win?).and_return(false)
      allow(board).to receive(:horizontal_win?).and_return(false)
      allow(board).to receive(:diagonal_win?).and_return(false)
      expect(board.winner?("x")).to eq(false)
    end

  end

end