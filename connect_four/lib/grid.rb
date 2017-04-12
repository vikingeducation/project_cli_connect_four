=begin

Public interface:

:grid_arr (reader)
initialize
add_piece(column, disc)
first_available_spot(column)
full?
winner?

=Private methods=

valid_column_number?
destination_col_available?(column)
vertical_winner?(disc)
horizontal_winner?(disc)
diagonal_winner?(disc)
verticals
horizontals
diagonals

=Paths=

  initialize
    -creates a grid

  render
    -renders a grid that's a correct representation of the model (@grid_arr)

  add_piece
    -correctly adds piece to the grid

  full? 
    -returns true if grid is full, false if not

  winner? 
    -returns true if there's either a vertical/horizontal/diagonal winner, else false
    


=end

class Grid

  attr_accessor :grid_arr

  def initialize(grid_arr = nil)

     @grid_arr = grid_arr ||= Array.new(7){ Array.new(6) }

  end

  def render
    puts
    rows = @grid_arr[0].length - 1
    while rows >= 0
      @grid_arr.each do |column|
        column[rows].nil? ? print(" - ") : print(" #{column[rows]} ")
      end
      puts
      rows -= 1 
    end

    print " =================== "
    puts

  end

  def add_piece(column, disc)      
    @grid_arr[column][first_available_spot(column)] = disc
  end

  def first_available_spot(column)
    @grid_arr[column].index(&:nil?)
  end

  def full? 

    @grid_arr.all? do |row|
      row.none?(&:nil?)
    end

  end

  def winner?(disc)
    vertical_winner?(disc) ||
    horizontal_winner?(disc) ||
    diagonal_winner?(disc)
  end

  private

  def destination_col_available?(column)

    if @grid_arr[column]
      @grid_arr[column].last.nil?
      true
    else
      false
    end

  end

  def vertical_winner?(disc)
    verticals.any? do |vertical|
      vertical.all?{ |cell| cell == disc }
    end
  end

  def horizontal_winner?(disc)
    horizontals.any? do |horizontal|
      horizontal.all?{ |cell| cell == disc }
    end
  end

  def diagonal_winner?(disc)
    diagonals.any? do |diagonal|
      diagonal.all?{ |cell| cell == disc }
    end
  end

  def verticals
    verticals = []
    @grid_arr.each do |column|
      3.times do |i|
        verticals << [column[i], column[i + 1], column[i + 2], column[i + 3]]
      end
    end
    verticals
  end

  def horizontals
    horizontals = []

      4.times do |i|
        6.times do |j|
          horizontals << [@grid_arr[i][j], @grid_arr[i + 1][j], @grid_arr[i + 2][j] ,@grid_arr[i + 3][j]]
        end
      end

    horizontals
  end

  def diagonals 
    diagonals = diagonals_down + diagonals_up
  end

  def diagonals_down

    diagonals = []

    3.upto(6) do |column_number|
      3.upto(5) do |row_number| 
        diagonals << [ @grid_arr[column_number][row_number - 3], 
                       @grid_arr[column_number - 1][row_number - 2], 
                       @grid_arr[column_number - 1][row_number - 2], 
                       @grid_arr[column_number - 3][row_number] ]  
      end
    end

    diagonals 

  end

  def diagonals_up

    diagonals = []

    3.downto(0) do |column_number|
      3.upto(5) do |row_number| 
        diagonals << [ @grid_arr[column_number][row_number - 3], 
                       @grid_arr[column_number + 1][row_number - 2], 
                       @grid_arr[column_number + 2][row_number - 1], 
                       @grid_arr[column_number + 3][row_number] ]  
      end
    end

    diagonals 

  end

end