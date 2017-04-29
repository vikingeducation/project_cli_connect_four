require 'colorize' # https://github.com/fazibear/colorize

class C4_space
  @@states = [:empty, :red, :yellow]
  @@unknown_state_mssg = "C4_space class: your disc wasn't either :blue or :yellow, missed any : ?"
  @@DISC = "\u2B24".encode('utf-8')

  def initialize
    @state = :empty
  end

  def set(new_state)
    raise(@@unknown_state_mssg) unless @@states.include?(new_state)
    # this should only happen, if at all, in development
    if @state != :empty && new_state != :empty
      false # a space with a disc does not accept a new disc
    else
      @state = new_state
    end
  end

  def render
    @state == :empty ? @@DISC + " ": @@DISC.colorize(@state) + " "
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
    puts "\e[H\e[2J\n"
    puts "\t  1 2 3 4 5 6 7"
    j = 1
    @board.each{ |y|
      row = "\t#{j} "
      y.each {|x| row += x.render}
      puts row
      j += 1
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
      false
    else
      i = 6
      while i > 0 && space(column, i).state != :empty
        i -= 1
      end
      space(column, i).set(player)
      set_last(column,i)
    end
  end

  def undrop
    set(@last_col, @last_row, :empty)
  end

  def column_win?(player)
    i = @last_row + 1
    total = 1
    while i <= 6 && space(@last_col, i).state == player do
      total += 1
      i += 1
    end
    true if total > 3
  end

  def row_win?(player)
    y = @last_col + 1
    total = 1
    # search to the right
    while y < 6 && space(y, @last_row).state == player do
      total += 1
      y += 1
    end
    y = @last_col - 1
    # search to the left
    while y > 0 && space(y, @last_row).state == player do
      total += 1
      y -= 1
    end
    true if total > 3
  end

  def f_diagonal_win?(player)
    x = @last_row + 1
    y = @last_col + 1
    total = 1
    # search downwards
    while y < 6 && x < 7 && space(y, x).state == player do
      total += 1
      y += 1
      x += 1
    end
    x = @last_row - 1
    y = @last_col - 1
    # search upward
    while y * x > 0 && space(y, x).state == player do
      total += 1
      y -= 1
      x -= 1
    end
    true if total > 3
  end

  def s_diagonal_win?(player)
    x = @last_row - 1
    y = @last_col + 1
    total = 1
    # search downwards
    while y < 6 && x > 0 && space(y, x).state == player do
      total += 1
      y += 1
      x -= 1
    end
    x = @last_row + 1
    y = @last_col - 1
    # search upward
    while y > 0 && x < 7 && space(y, x).state == player do
      total += 1
      y -= 1
      x += 1
    end
    true if total > 3
  end

  def won?(player)
    if column_win?(player)
      true
    elsif row_win?(player)
      true
    elsif f_diagonal_win?(player)
      true
    elsif s_diagonal_win?(player)
      true
    else
      false
    end
  end
end

class Player
  def initialize(two_players)
    @player = :yellow
    @two_players = two_players
  end

  def switch
    @player == :yellow ? @player = :red : @player = :yellow
  end

  def who
    @player
  end

  def win?(game, player)
    col = 1
    while col < 7 do
      game.drop(col, player)
      if game.won?(player)
        game.undrop
        found = col
        break
      else
        game.undrop
        col += 1
        found = false
      end
    end
    found
  end

  def ai_input(game)
    play_to_win = win?(game, :yellow)
    play_defense = win?(game, :red)
    if play_to_win
      play_to_win
    elsif play_defense
      play_defense
    else
      [1,2,3,4,5,6,7].sample
    end
  end

  def ask_input(game)
    if @two_players && @player == :yellow
      ai_input(game)
    else
      puts( "#{@player}, choose a column to drop your stone")
      col = gets.chomp.to_i
      if col < 1 || col > 7
        ask_input(game)
      else
        col
      end
    end
  end
end



game = C4_board.new
if ARGV[0] == "2"
  two_players = true
else
  two_players = false
end
ARGV.clear

player = Player.new(two_players)
dropped = true
turns = 0

while !game.won?(player.who) do
  break if turns > 42
  player.switch unless dropped
  game.render
  dropped = game.drop(player.ask_input(game), player.who)
  turns += 1
end

game.render
if turns > 42
  puts("It's a draw")
else
  puts("#{player.who} won!")
end
