require 'grid'

describe Grid do
  
  let(:grid_instance){ Grid.new }
  let(:grid_model){ grid_instance.grid_arr }

  describe '#initialize' do
    
    it 'creates a Grid instance' do
      expect(grid_instance).to be_a(Grid)
    end

    it 'creates an array structure to store the discs in' do
      expect(grid_model).to be_an(Array)
    end

    it 'creates an array that\'s resembles the 7 columbs x 6 rows connect4 grid structure' do
      expect(grid_model.length).to eq(7)
      expect(grid_model[0].length).to eq(6)
    end

    it 'populates the grid with `nil`' do
      random_cell = grid_model[2][3]
      expect(random_cell).to eq(nil)
    end
   
  end

  describe '#add_piece(column, disc)' do

    it 'adds a piece correctly to the grid model' do

      result_grid = [
        [nil, nil, nil, nil, nil, nil], 
        [nil, nil, nil, nil, nil, nil], 
        [nil, nil, nil, nil, nil, nil], 
        [:O, :O, nil, nil, nil, nil], 
        [nil, nil, nil, nil, nil, nil], 
        [nil, nil, nil, nil, nil, nil], 
        [nil, nil, nil, nil, nil, nil]
      ]

      grid_instance.add_piece(3, :O)
      grid_instance.add_piece(3, :O)

      expect(grid_instance.grid_arr).to eq(result_grid)

    end

  end 

  describe '#first_available_spot(column)' do
    
    it 'returns the index of the first item that is nil' do
      
      grid_instance.grid_arr = [[:X, :X, nil, nil, nil, nil], [], [], [], [], [], []]
      expect(grid_instance.first_available_spot(0)).to eq(2)

    end

  end 

  describe '#full?' do

    let(:full_grid){ Grid.new(Array.new(7){ Array.new(6, :O) }) }
    
    it 'should start our being false' do
      expect(Grid.new(Array.new(7){ Array.new(6) }).full?).to be false
    end

    it 'returns true if all 42 places of the grid are filled up with a disc' do
      expect(full_grid.full?).to be true
    end

  end

  describe '#winner?(disc)' do  

    it 'returns true when there is a vertical winner' do
      grid_instance.grid_arr = [[:X, :X, :X, :X], [], [], [], [], [], []]
      expect(grid_instance.winner?(:X)).to be true
    end

    it 'returns true when there is a horizontal winner' do
      grid_instance.grid_arr = [[:X], [:X], [:X], [:X], [], [], []]
      expect(grid_instance.winner?(:X)).to be true
    end

    it 'returns true when there is a diagonal winner' do
      grid_instance.grid_arr = [[:X, "-", "-", "-"], ["-", :X, "-", "-"], ["-", "-", :X, "-"], ["-", "-", "-", :X], [], [], []]
      expect(grid_instance.winner?(:X)).to be true
    end

  end

end