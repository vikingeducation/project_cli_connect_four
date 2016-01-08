require 'board'

describe Board do

  let(:board) { Board.new }

  describe '#initialize' do
    it 'makes a grid with a height of 6' do
      grid = board.grid
      expect(grid.size).to eq 6
    end

    it 'makes a grid with a width of 7' do
      row = board.grid[0]
      expect(row.size).to eq 7
    end

    it 'populates the grid with underscores' do
      value = board.grid[0][0]
      expect(value).to eq '_ '
    end
  end

  describe '#column_full?' do
    it 'returns true if a column is full' do
      new_grid = [
        ["_ ","_ ","_ ","_ ","O ","_ ","_ "],
        ["_ ","_ ","_ ","_ ","O ","_ ","_ "],
        ["_ ","_ ","_ ","_ ","O ","_ ","_ "],
        ["_ ","_ ","_ ","_ ","O ","_ ","_ "],
        ["_ ","_ ","_ ","_ ","O ","_ ","_ "],
        ["_ ","_ ","_ ","_ ","O ","_ ","_ "],
        ["_ ","_ ","_ ","_ ","O ","_ ","_ "],
      ]
      board.grid = new_grid
      expect(board.column_full?(4)).to eq true
    end
  end

  describe '#full?' do
    it 'returns true if every column is full' do
      new_grid = [
        ["O ","O ","O ","O ","O ","O ","O "],
        ["O ","O ","O ","O ","O ","O ","O "],
        ["O ","O ","O ","O ","O ","O ","O "],
        ["O ","O ","O ","O ","O ","O ","O "],
        ["O ","O ","O ","O ","O ","O ","O "],
        ["O ","O ","O ","O ","O ","O ","O "],
      ]
      board.grid = new_grid
      expect(board.full?).to eq true
    end
  end

  describe '#add_piece' do
    it 'only adds a piece to the first empty position in a col' do
      new_grid = [
        ["_ ","_ ","_ ","_ ","O ","_ ","_ "],
        ["_ ","_ ","_ ","_ ","_ ","_ ","_ "],
        ["_ ","_ ","_ ","_ ","_ ","_ ","_ "],
        ["_ ","_ ","_ ","_ ","_ ","_ ","_ "],
        ["_ ","_ ","_ ","_ ","_ ","_ ","_ "],
        ["_ ","_ ","_ ","_ ","_ ","_ ","_ "],
        ["_ ","_ ","_ ","_ ","_ ","_ ","_ "],
      ]
      result_grid = [
        ["_ ","_ ","_ ","_ ","O ","_ ","_ "],
        ["_ ","_ ","_ ","_ ","O ","_ ","_ "],
        ["_ ","_ ","_ ","_ ","_ ","_ ","_ "],
        ["_ ","_ ","_ ","_ ","_ ","_ ","_ "],
        ["_ ","_ ","_ ","_ ","_ ","_ ","_ "],
        ["_ ","_ ","_ ","_ ","_ ","_ ","_ "],
        ["_ ","_ ","_ ","_ ","_ ","_ ","_ "],
      ]
      board.grid = new_grid
      board.add_piece('O', 4)
      expect(board.grid).to eq result_grid
    end
  end

  describe '#render' do
    it 'displays the board' do
      output_string = 
"=============
_ _ _ _ _ _ _ 
_ _ _ _ _ _ _ 
_ _ _ _ _ _ _ 
_ _ _ _ _ _ _ 
_ _ _ _ _ _ _ 
_ _ _ _ _ _ _ 
=============
"
      expect{ board.render }.to output(output_string).to_stdout
    end
  end

  describe '#winning_combination?' do
    it 'checks for diagonal wins' do
      board.grid = [
        ["_ ","_ ","_ ","_ ","_ ","_ ","_ "],
        ["_ ","_ ","_ ","_ ","_ ","_ ","_ "],
        ["_ ","X ","_ ","_ ","_ ","_ ","_ "],
        ["_ ","_ ","X ","_ ","_ ","_ ","_ "],
        ["_ ","_ ","_ ","X ","_ ","_ ","_ "],
        ["_ ","_ ","_ ","_ ","X ","_ ","_ "],
        ["_ ","_ ","_ ","_ ","_ ","_ ","_ "],
      ]

      expect(board.winning_combination?('X')).to eq true
    end

    it 'checks for horizontal wins' do
      board.grid = [
        ["_ ","_ ","_ ","_ ","_ ","_ ","_ "],
        ["_ ","_ ","_ ","_ ","_ ","_ ","_ "],
        ["_ ","X ","X ","X ","X ","_ ","_ "],
        ["_ ","_ ","_ ","_ ","_ ","_ ","_ "],
        ["_ ","_ ","_ ","_ ","_ ","_ ","_ "],
        ["_ ","_ ","_ ","_ ","_ ","_ ","_ "],
        ["_ ","_ ","_ ","_ ","_ ","_ ","_ "],
      ]

      expect(board.winning_combination?('X')).to eq true
    end

    it 'checks for vertical wins' do
      board.grid = [
        ["_ ","_ ","_ ","_ ","_ ","_ ","_ "],
        ["_ ","_ ","_ ","_ ","_ ","_ ","_ "],
        ["_ ","X ","X ","_ ","_ ","_ ","_ "],
        ["_ ","X ","_ ","_ ","_ ","_ ","_ "],
        ["_ ","X ","_ ","_ ","_ ","_ ","_ "],
        ["_ ","X ","_ ","_ ","_ ","_ ","_ "],
        ["_ ","_ ","_ ","_ ","_ ","_ ","_ "],
      ]

      expect(board.winning_combination?('X')).to eq true
    end

    it 'returns false if no winning moves' do
      board.grid = [
        ["_ ","_ ","_ ","_ ","_ ","_ ","_ "],
        ["_ ","_ ","_ ","_ ","_ ","_ ","_ "],
        ["_ ","X ","X ","_ ","_ ","_ ","_ "],
        ["_ ","X ","_ ","_ ","_ ","_ ","_ "],
        ["_ ","_ ","_ ","_ ","_ ","_ ","_ "],
        ["_ ","X ","_ ","_ ","_ ","_ ","_ "],
        ["_ ","_ ","_ ","_ ","_ ","_ ","_ "],
      ]

      expect(board.winning_combination?('X')).to eq false
    end
  end
end
