require 'colorize'

class Board
  attr_accessor :columns

  def initialize
    make_board
  end

  def make_board
    @columns = {}
    1.upto(7) do |i|
      @columns[i] = Array.new(6)
    end
    @columns 
  end

  def valid_move?(column)
    if @columns[column].last == nil
      true
    else
      print "That column is full!"
    end 
  end

  def add_piece(column, piece)
    if valid_move?(column)
      top_blank = @columns[column].find_index(&:nil?)
      @columns[column][top_blank] = piece
    end    
  end

  def render_board
    system 'clear'
    5.downto(0) do |position|
      print "\n"
      1.upto(7) do |col_number|
        print " "
        print "(#{(make_color(@columns[col_number][position]))})"
        print " "
      end
    end
    print "\n"
  end

  def make_color(piece)
    colors = {:r => :light_red, 
              :y => :light_yellow,
              :b => :light_blue,
              :g => :light_green}
    if piece == nil
      "o"
    else
      "o".colorize((colors[piece]))
    end
    
  end

  def full?
    @columns.each do |col_number, column|
      return false if column.any? {|pos| pos == nil}
    end
    return true
  end

  def winning_line?(piece)
    if winning_horizontal?(piece) ||
      winning_diagonal?(piece) ||
      winning_vertical?(piece)
      return true
    end
  end

  def diagonal_steps?(piece, starting_column, starting_position)
    if @columns[(starting_column + 1)][(starting_position + 1)] == piece &&
      @columns[(starting_column + 2)][(starting_position + 2)] == piece &&
      @columns[(starting_column + 3)][(starting_position + 3)] == piece ||
      @columns[(starting_column + 1)][(starting_position - 1)] == piece &&
      @columns[(starting_column + 2)][(starting_position - 2)] == piece &&
      @columns[(starting_column + 3)][(starting_position - 3)] == piece 
      return true      
    end
  end

  def winning_diagonal?(piece)
    @columns.each do |col_number, column|
      column.each_with_index do |blank, position|
        if col_number == 5
          return false
        elsif blank == piece &&
          diagonal_steps?(piece, col_number, position)
          return true                
        end
      end
    end
  end

  def winning_horizontal?(piece)
    @columns.each do |col_number, column|
      column.each_with_index do |blank, position|
        if col_number == 5
          return false
        elsif blank == piece &&
          @columns[(col_number + 1)][position] == piece &&
          @columns[(col_number + 2)][position] == piece &&
          @columns[(col_number + 3)][position] == piece
          return true
        end
      end
    end
  end

  def winning_vertical?(piece)
    @columns.each do |col_number, column|
      column.each_with_index do |blank, position|
        if blank == piece &&
          column[(position + 1)] == piece &&
          column[(position + 2)] == piece &&
          column[(position + 3)] == piece
          return true
        end
      end
    end
    return false
  end
  
end