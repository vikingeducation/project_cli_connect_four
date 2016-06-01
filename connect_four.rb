class Connection_four
  # intro_paragraph
  # enter player name
  # @player_1 @player_2
  # take turns
  # get input
  # display it
  # check win or not
    # diagonal * 2
    # horizontal * 2
  BOARD_SIZE = 7
  def initialize(p1_name, p2_name)
    @p1 = Player.new(p1_name)
    @p2 = Player.new(p2_name)
    @board = Board.new(BOARD_SIZE)
    @round = 1
  end

  def start
    intro
    @board.initialize_board
    @board.render
    loop do
      if @round.odd?
        move = @p1.get_move
        player_process(move)
      else
        move = @p2.get_move
        player_process(move)
      end
      @round += 1
      @board.render
      move = ""
    end
  end

  def intro
    puts "Welcome to connect four name! #{@p1.player_name} and #{@p2.player_name}!"
    puts "Your goal is to connect four dots to form a line"
  end

  def validate?(move)
    # Invalid in term of the input
    move.each do |one_coord|
      if one_coord.is_a? Integer
        if !(one_coord < BOARD_SIZE) || !(one_coord >= 0)
          return false
        end
      else
        return false
      end
    end
    # Invalid in term of the location
    if @board.board[move[1]][move[0]] != "-"
      return false
    else
      return true
    end
  end

  def player_process(move)
    if validate?(move)
      @board.record_move(move, @round)
      if win?(move)
        if @round.odd?
          puts "#{@p1.player_name}! You win!"
          exit
        else
          puts "#{@p2.player_name}! You win!"
          exit
        end
      end
    else
      puts "your input is invalid. Please enter again!"
      @round -= 1
    end
  end

  def win?(move)
    @round.odd? ? mark = "o" : mark = "x"
    if horizontal?(move, mark) >= 4 || vertical?(move, mark) >= 4 || left_top_right_bottom?(move, mark) >= 4 || left_bottom_right_top?(move, mark) >= 4
      return true
    end
    return false
  end

  def horizontal?(move, mark)
    counter = 1
    3.times do |n|
      n += 1
      x = @board.board[move[1]][move[0]-n]
      if x == mark
        counter += 1
      else
        break
      end
    end
    3.times do |n|
      n += 1
      x = @board.board[move[1]][move[0]+n]
      if x == mark
        counter += 1
      else
        break
      end
    end
    counter
  end

  def vertical?(move, mark)
    counter = 1
    3.times do |n|
      n += 1
      x = @board.board[move[1]+n][move[0]]
      if x == mark
        counter += 1
      else
        break
      end
    end
    3.times do |n|
      n += 1
      x = @board.board[move[1]-n][move[0]]
      if x == mark
        counter += 1
      else
        break
      end
    end
    counter
  end

  def left_top_right_bottom?(move, mark)
    counter = 1
    3.times do |n|
      n += 1
      x = @board.board[move[1]+n][move[0]+n]
      if x == mark
        counter += 1
      else
        break
      end
    end
    3.times do |n|
      n += 1
      x = @board.board[move[1]-n][move[0]-n]
      if x == mark
        counter += 1
      else
        break
      end
    end
    counter
  end

  def left_bottom_right_top?(move, mark)
    counter = 1
    3.times do |n|
      n += 1
      x = @board.board[move[1]+n][move[0]-n]
      if x == mark
        counter += 1
      else
        break
      end
    end
    3.times do |n|
      n += 1
      x = @board.board[move[1]-n][move[0]+n]
      if x == mark
        counter += 1
      else
        break
      end
    end
    counter
  end

end

class Player
  attr_reader :player_name

  def initialize(name)
    @player_name = name
  end

  def get_move
    puts "#{@player_name}! Please enter your move using ordinate (ex. 0,1 2,2 4,5 0,0)"
    move = gets.chomp.split(",")
    move = move.map { |n| n.to_i }
  end
end

class Board
  attr_reader :board

  def initialize(bz)
    @board_size = bz
    @board = []
  end

  def initialize_board
    @board_size.times do
      @board << Array.new(@board_size, "-")
    end
  end

  def render
    st = "  "
    @board_size.times do |n|
      st << n.to_s << " "
    end
    print st
    puts ""
    @board.each_with_index do |each_row, i|
      st = "#{i.to_s} "
      each_row.each do |each_dot|
        st << each_dot << " "
      end
      print st
      puts ""
    end
  end

  def record_move(move, round)
    if round.odd?
      @board[move[1]][move[0]] = "o"
    else
      @board[move[1]][move[0]] = "x"
    end
  end
end

connection_four = Connection_four.new("Bill","Tan")
connection_four.start