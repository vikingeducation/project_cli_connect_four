class Board
  attr_reader :columns

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
    column = move - 1
    if move_location_valid?(column)
      @columns[column].push(symbol)
      true
    else
      false
    end
  end

  def winning_combination?(symbol, columns = @columns)
    winning_diagonal?(symbol, columns) || winning_horizontal?(symbol, columns) ||winning_vertical?(symbol, columns)
  end

  def full?
    @columns.to_a.all? { |col_pair| col_pair.last.size == 6 }
    # binding.pry
  end

  def spot_open?(column)
    @columns[column].size < 6
  end

  private

  def move_location_valid?(column)
    if @columns[column].size == 6
      puts "I'm sorry, that column is full. Try again."
    else
      true
    end
  end

  def winning_diagonal?(symbol, columns)
    all_diagonals(columns).any? {|diag| diag.include?(symbol * 4)}
  end

  def winning_horizontal?(symbol, columns)
    all_horizontals(columns).any? {|row| row.include?(symbol * 4)}
  end

  def winning_vertical?(symbol, columns)
    all_verticals(columns).any? {|column| column.include?(symbol * 4)}
  end

  def all_verticals(columns)
    verticals = []
    columns.each {|column, content| verticals << content.join}
    verticals
  end

  def all_horizontals(columns)
    horizontals = []
    6.times do |row_index|
      horizontals[row_index] = ''
      7.times do |column_index|
        if columns[column_index][row_index] == nil
          horizontals[row_index] << '-'
        else
          horizontals[row_index] << columns[column_index][row_index]
        end
      end
    end
    horizontals
  end

  def all_diagonals(columns)
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
        symbol = columns[coords.first][coords.last]
        symbol.nil? ? diagonal += '-' : diagonal += symbol
      end
      diagonals << diagonal
    end
    diagonals
  end

end