class Board

  def initialize
    @columns = {
      0 => [],
      1 => [],
      2 => [],
      3 => [],
      4 => [],
      5 => [],
      6 => []
    }
  end

  def render
    row_strings = []

    6.times do |row_index|
      row_strings[row_index] = ''
      7.times do |column_index|
        if @columns[column_index][row_index] == nil
          row_strings[row_index] << "|   "
        else
          row_strings[row_index] << "| #{@columns[column_index][row_index]} "
        end
      end
      row_strings[row_index] << ("|\n" + '-' * 29 + "\n")
    end

    puts "\nCurrent Board:"

    # Print column labels to help players
    (1..7).each {|col| print "  #{col} "}
    puts "\n"

    # Reverse row strings so it looks like a connect four board
    row_strings.reverse.each { |row| puts row }
  end

  def place_move(move, symbol)
    column = move -1
    @columns[column].push(symbol)
    #TODO:  validate move

    #TODO: delete this
    render
    true
  end

  def winning_combination?(symbol)
    winning_diagonal?(symbol) || winning_horizontal?(symbol) ||winning_vertical?(symbol)
  end

  def full?
    @columns.all? { |column| column.size == 6 }
  end

  private

  def winning_diagonal?(symbol)
    all_diagonals.any? {|diag| diag.include?(symbol * 4)}
  end

  def winning_horizontal?(symbol)
    all_horizontals.any? {|row| row.include?(symbol * 4)}
  end

  def winning_vertical?(symbol)
    all_verticals.any? {|column| column.include?(symbol * 4)}
  end

  def all_verticals
    verticals = []
    @columns.each {|column, content| verticals << content.join}
    verticals
  end

  def all_horizontals
    horizontals = []
    6.times do |row_index|
      horizontals[row_index] = ''
      7.times do |column_index|
        unless @columns[column_index][row_index] == nil
          horizontals[row_index] << @columns[column_index][row_index]
        end
      end
    end
    horizontals
  end

  def all_diagonals
    diagonals = []
    valid_col_rows = [
      [ [0,2], [1,3], [2,4], [3,5] ],
      [ [0,1], [1,2], [2,3], [3,4], [4,5] ],
      [ [0,0], [1,1], [2,2], [3,3], [4,4], [5,5] ],
      [ [1,0], [2,1], [3,2], [4,3], [5,4], [6,5] ],
      [ [2,0], [3,1], [4,2], [5,3], [6,4] ],
      [ [3,0], [4,1], [5,2], [6,3] ],

      [ [0,3], [1,2], [2,1], [3,0] ],
      [ [0,4], [1,3], [2,2], [3,1], [4,0] ],
      [ [0,5], [1,4], [2,3], [3,2], [4,1], [5,0] ],
      [ [1,5], [2,4], [3,3], [4,2], [5,1], [6,0] ],
      [ [2,5], [3,4], [4,3], [5,2], [6,1] ],
      [ [3,5], [4,4], [5,3], [6,2] ],
    ]

    valid_col_rows.each do |diag|
      diagonal = ''
      diag.each do |coords|
        symbol = @columns[coords.first][coords.last]
        diagonal += symbol unless symbol.nil?
      end
      diagonals << diagonal
    end
    diagonals
  end

end