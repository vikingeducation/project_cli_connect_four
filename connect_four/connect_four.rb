class ConnectFour

  def initialize
    @board = GameBoard.new
    @player1 = Player.new("Player 1", "x", @board)
    @player2 = Player.new("Player 2", "o", @board)

  end

  def play 

    @board.render
    input = ""
    current_player = @player1
    until player_quit?(input) || @board.win_condition?
      input = current_player.get_input
      @board.update_board(input, current_player.piece)
      @board.render
      if @board.win_condition?
        break
      end

      current_player = switch_players(current_player)
      input = current_player.get_input
      @board.update_board(input, current_player.piece)
      @board.render
      if @board.win_condition?
        break
      end
       current_player = switch_players(current_player)
    end

    when_game_over(current_player)

  end

  def player_quit?(input)
    if input == "q"
      return true
    else 
      return false
    end
  end

  def switch_players(player)
    if player.piece == "x"
      return @player2
    else
      return @player1
    end
  end

  def when_game_over(player)
    if @board.win_condition?
      puts "#{player.name} won!"
      return true
    else
      return false
    # elsif tie?
    #   puts "There is a draw"
    end
  end

end


class GameBoard

  attr_accessor :game_board_arr

  def initialize
    @game_board_arr = []
    create_board
  end

  def create_board
    7.times do 
      row =[] 
      @game_board_arr.push(row)
    end
  end

  def update_board(column_input, piece)
    
    @game_board_arr[column_input].push(piece)
    
    
  end

  def render
    test_array = []
    row = 0
    row_index = 5
    while row_index >-1
      @game_board_arr.each do 
        test_array.push(@game_board_arr[row][row_index])
        row += 1  
      end
      print "#{test_array}"
      print "\n"
      test_array.clear

      row = 0
      row_index-=1      
    end

  end

  def win_condition?
    if vertical_win?
      return true
    elsif horizontal_win?
      return true
    elsif diagonal_win?
      return true
    else
      return false
    end
  end

  def vertical_win?
    return_bool = false
    @game_board_arr.each do |row|
      index = 0
      
      while index<3
        if !row[index..index+3].nil? && (row[index..index+3].count("x") == 4 || row[index..index+3].count("o") == 4)
          return_bool = true
        end
        
        index +=1
      end
    end
    return_bool
  end

  def horizontal_win?
    return_bool = false
    test_array = []
    row_index = 0
    row = 0
    while row_index < 6
      @game_board_arr.each do 
        test_array.push(@game_board_arr[row][row_index])
        row += 1
      end

      if winning_array?(test_array)
        return_bool =  true
      else
        return_bool = false
      end

      row_index +=1
      row = 0
    end
    return_bool
  end

  def diagonal_win?
     
    4.times do |column|
      3.times do |row|

        if @game_board_arr[column ]    [row ] != nil && 
          (@game_board_arr[column]    [row   ] == 
           @game_board_arr[column + 1][row + 1] &&
           @game_board_arr[column + 1][row + 1] == 
           @game_board_arr[column + 2][row + 2] &&
           @game_board_arr[column + 2][row + 2] == 
           @game_board_arr[column + 3][row + 3])
           
          return true
        end


      end

    end

    i = 0


    4.times do |column|
      3.times do |row|

        if @game_board_arr.reverse[column ]    [row] != nil &&
          (@game_board_arr.reverse[column + i]    [row + i]     == 
           @game_board_arr.reverse[column + i + 1][row + i + 1] &&
           @game_board_arr.reverse[column + i + 1][row + i + 1] == 
           @game_board_arr.reverse[column + i + 2][row + i + 2] &&
           @game_board_arr.reverse[column + i + 2][row + i + 2] == 
           @game_board_arr.reverse[column + i + 3][row + i + 3] )

          return true
        end

      end

    end

    return false
  end

  def winning_array?(test_array)
    return_bool = false
    index = 0
    while index< 3
      if test_array[index..index+3] != nil && (test_array[index..index+3].count("x") == 4 || test_array[index..index+3].count("o") == 4)
        return_bool = true
      end
      index+=1
    end
    return_bool
  end
end


class Player

  attr_reader :name, :piece

  def initialize(name, piece, board)
    @name = name
    @piece = piece
    @board = board
  end

  def get_input
    puts "Enter the column below"
    print ">>"
    input = gets.chomp
    return input if input == "q"
    input = input.to_i - 1

    unless is_valid?(input)
      until is_valid?(input)
        puts "Invalid Entry. Please enter an integer from 1-6"
        print ">>"
        input = gets.chomp
        return input if input == "q"
      end
    end
    input
  end


  def is_valid?(input)
    if input <0 || input > 6
      return false
    elsif @board.game_board_arr[input].length < 6
        return true
    else
      print "something went down"
      return false
    end
  end

  def player_quit?(input)
    if input == "q"
      return true
    else
      return false
    end
  end


end

  c = ConnectFour.new
  c.play


