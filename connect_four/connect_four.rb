require 'colorize' # https://github.com/fazibear/colorize

class C4_space
  @@states = [:empty, :red, :yellow]
  @@unknown_state_mssg = "C4_space class: your disc wasn't either :blue or :yellow, missed any : ?"

  def initialize
    @state = :empty
  end

  def set(new_state)
    raise(@@unknown_state_mssg) unless @@states.include?(new_state)
    # this should only happen, if at all, in development
    if @state != :empty
      false # a space with a disc does not accept a new disc
    else
      @state = new_state
    end
  end

  def render
    @state == :empty ? "O" : "*".colorize(@state)
  end

  def state
    @state
  end

end


class C4_board

  def initialize
    @board = Array.new(6) { Array.new(7) { C4_space.new} }
    @last_col = 0
    @last_row = 0
  end

  def set_last(column, row)
    @last_row = row
    @last_col = column
    print(@last_col, @last_row, "\n")
  end

  def render
    puts "1234567"
    @board.each{ |y|
      row = "\t"
      y.each {|x| row += x.render}
      puts row
    }
  end

  def space(column, row)
    y_index = column - 1
    x_index = row - 1
    @board[x_index][y_index]
  end

  def set(column, row, data)
    space(column, row).set(data)
  end

  def column_full?(column)
    space(column, row=1).state != :empty
  end

  def drop(column, player)
    if column_full?(column)
      puts("Column full")
    else
      i = 6
      while i > 0 && space(column, i).state != :empty
        i -= 1
      end
      space(column, i).set(player)
      set_last(column,i)
    end
  end

end

a = C4_board.new

a.render

5.times { a.drop(2,:yellow) }

a.render

c = a.drop(2,:red)

a.render

b = a.drop(2,:yellow)

puts(c)
puts("c is nil") if b == nil

a.render
