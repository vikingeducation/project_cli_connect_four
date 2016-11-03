class Board
  attr_accessor :layout
  attr_accessor :last_move
  
  def initialize
    @layout = Array.new(7){Array.new(6) {'_'} }
    @last_move = nil
  end

  def display
    index_num = 7
    while index_num > -1 do 
      @layout.each do |list|
        print list[index_num]
      end
      print "\n"
      index_num -= 1
    end
    puts "1234567"
  end

  def full?
    @layout.all? { |column| full_column?(column) }
  end

  def four_connected?
    judge = WinJudge.new(@layout, @last_move)
    result = judge.check_for_win?
    judge = nil
    result
  end

  def full_column?(column)
    column.last != "_"
  end

  def add_piece(column_number, piece)
    index = column_number - 1
    column = @layout[index]
    return false if full_column?(column)
    piece_index = find_piece_index(column)
    @layout[index][piece_index] = piece
    @last_move = [index, piece_index]
  end

  def find_piece_index(column)
    index = 0
    column.each_with_index do |cell, cell_number|
      if cell != "_"
        index = cell_number + 1
      end
    end
    index
  end
end