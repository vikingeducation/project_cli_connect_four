class Board

  def initialize
    @columns = {
      0 => [],
      1 => [],
      2 => ['x','o'],
      3 => ['o'],
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

end