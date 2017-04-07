# Your code here!


class ConnectFour

  attr_reader :current_player

  def initialize

    @grid = Grid.new

    @player_1 = Player.new("Player 1", :X, @grid)
    @player_2 = Player.new("Player 2", :O, @grid)

    @current_player = @player_1

  end

  def play

    instructions
    loop do 
      @grid.render     
      @current_player.get_choice 
 
      break if game_over?

      switch_players

    end

  end

  def instructions
    
    puts
    puts "=== Welcome to Connect Four! ==="
    puts
    puts "To win Connect Four you must be the first player"
    puts "to get four of your discs in a row,"
    puts "either horizontally, vertically or diagonally."
    puts
    puts "Player 1, your discs are represented by an X."
    puts "Player 2, your discs are represented by an O."
    puts 
    puts "Let's get started!"
    puts

  end

  def game_over?

    winner? || draw?

  end

  def winner?

    vertical_winner?
    horizontal_winner?
    diagonal_winner?

  end

  def draw?
    
    if @grid.full?
      puts "It's a draw."
      true
    else
      false
    end

  end

  def switch_players

    if @current_player == @player_1
    	@current_player = @player_2
    else
      @current_player = @player_1
    end

  end

end

class Player

  def initialize(name = "Anonymous", disc, grid)
    
    @name = name 
    @disc = disc
    @grid = grid

  end
  
  def get_choice

    loop do
      column = ask_for_column - 1

      break if valid_column_number?(column) && @grid.add_piece(column, @disc)
    end

  end

  def ask_for_column
    
    puts
    puts "#{@name}, enter the column (1-7) that you want to put your disc (#{@disc}) in."
    gets.strip.to_i

  end

  def valid_column_number?(column)
    
    if (0..6).include?(column)
    	true
    else
    	puts "Your column of choice is not within the allowed range (1-7)."
    end

  end

end

class Grid

  attr_reader :grid_arr

  def initialize

    @grid_arr = Array.new(7){ Array.new(6) }

  end

  def render
    columns = @grid_arr.length - 1
    while columns >= 0
      @grid_arr.each do |row|
        row[columns].nil? ? print(" - ") : print(" #{row[columns]} ")
      end
      puts
      columns -= 1 
    end

    print " =================== "
    puts

  end

  def add_piece(column, disc)

    if destination_col_available?(column)
      first_available_spot = @grid_arr[column].index(&:nil?)
      
      @grid_arr[column][first_available_spot] = disc
      true
    else
      false
    end

  end

  def destination_col_available?(column)

    if @grid_arr[column].last.nil?
      true
    else
      false
    end

  end

  def vertical_winner?
    
    verticals.any? do |vertical|
      vertical.all?{ |disc| disc == @current_player.disc}
    end

  end

  def horizontal_winner?
    
  end

  def diagonal_winner?
    
  end

  def verticals
    vertical_possibilities = []
    @grid_arr.each do |column|
      3.times do |i|
        vertical_possibilities << [column[i], column[i + 1], column[i + 2], column[i + 3]]
      end
    end
    vertical_possibilities
  end

  def horizontals
    horizontal_possibilities = []

      4.times do |i|
        6.times do |j|
          horizontal_possibilities << [@grid_arr[i][j], @grid_arr[i + 1][j], @grid_arr[i + 2][j] ,@grid_arr[i + 3][j]]
        end
      end

    horizontal_possibilities
  end

  def diagonals

    diagonal_possibilities = [
    [@grid_arr[3][0], @grid_arr[4][1], @grid_arr[5][2], @grid_arr[6][3]],
    [@grid_arr[2][0], @grid_arr[3][1], @grid_arr[4][2], @grid_arr[5][3]],   
    [@grid_arr[3][1], @grid_arr[4][2], @grid_arr[5][3], @grid_arr[6][4]],
    [@grid_arr[1][0], @grid_arr[2][1], @grid_arr[3][2], @grid_arr[4][2]],
    [@grid_arr[2][1], @grid_arr[3][2], @grid_arr[4][3], @grid_arr[5][4]],
    [@grid_arr[3][2], @grid_arr[4][3], @grid_arr[5][4], @grid_arr[6][5]],
    [@grid_arr[1][1], @grid_arr[2][2], @grid_arr[3][3], @grid_arr[4][4]],
    [@grid_arr[2][2], @grid_arr[3][3], @grid_arr[4][4], @grid_arr[5][5]],
    [@grid_arr[0][1], @grid_arr[1][2], @grid_arr[2][3], @grid_arr[3][4]],
    [@grid_arr[1][2], @grid_arr[2][3], @grid_arr[3][4], @grid_arr[4][5]],
    [@grid_arr[0][2], @grid_arr[1][3], @grid_arr[2][4], @grid_arr[3][5]]]

    diagonal_possibilities 

  end

  def full? 

    @grid_arr.all? do |row|
      row.none?(&:nil?)
    end

  end

end

t = ConnectFour.new
t.play