class Board
  attr_reader :current_player, :width

  def initialize(width = 5, height = 5, player1 = Player.new("r", false), player2 = Player.new("y", true))
    @player1 = player1
    @player2 = player2
    @width = width
    @height = height
    @board = Array.new(width, "0"){Array.new(height, "0")}
    @current_player = player1
    @players = [@player1, @player2]
    @finished = false
  end

  def switch_player
    @current_player = @players.select {|player| player != @current_player}.first
  end

  def validate(input)
    column(input).any? {|i| i == "0"}
  end

  def drop_piece(input)
    input_column = column(input)
    input_row = input_column.rindex { |i| i == "0" }
    @board[input_row][input] = @current_player.color
    determine_if_finished(input_row,input)
  end

  def display_board
    @board.each do |row|
      puts row.join(" ")
    end
  end

  def finished?
    @finished
  end

  def board_is_full?
    # Determine if top row does not have any nils
  end

  private

  def column(number)
    @board.map {|row| row[number]}
  end

  def determine_if_finished(x, y)
    victory_string = Array.new(4) { "#{@current_player.color}"}.join(",")
    # check if finished left / right
    horizontal_string = @board[x].join(",")
    @finished = true if horizontal_string.include?(victory_string)
    puts "A winner is #{current_player}!" if horizontal_string.include?(victory_string)
    # check if finished up / down
    vertical_string = column(y).join(",")
    @finished = true if vertical_string.include?(victory_string)
    puts "A winner is #{current_player}!" if vertical_string.include?(victory_string)
    # check if finished diagonally
    down_right_string = [@board[x][y]]
    4.downto(1) do |i|
      down_right_string << @board[x+i][y-i] if valid_square?(x+i,y-i)
    end
    down_left_string = [@board[x][y]]
    4.downto(1) do |i|
      down_left_string << @board[x-i][y-i] if valid_square?(x-i,y-i)
    end
    up_right_string = [@board[x][y]]
    4.downto(1) do |i|
      up_right_string << @board[x+i][y+i] if valid_square?(x+i,y+i)
    end
    up_left_string = [@board[x][y]]
    4.downto(1) do |i|
      up_left_string << @board[x-i][y+i] if valid_square?(x-i,y+i)
    end
    if down_right_string.join(",").include?(victory_string) ||
      down_left_string.join(",").include?(victory_string) ||
      up_right_string.join(",").include?(victory_string) ||
      up_left_string.join(",").include?(victory_string)
      @finished = true
      puts "A winner is #{current_player}!"
    end
  end

  def valid_square?(x,y)
    @board[x] && @board[x][y]
  end
end
