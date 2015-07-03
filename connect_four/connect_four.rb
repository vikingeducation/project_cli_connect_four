class ConnectFour

  def initialize
    @board = GameBoard.new
    @player1 = Player.new("Player 1", "x", @board)
    @player2 = Player.new("Player 2", "o", @board)
  end

  def play 

    current_player = @player1
    
    until game_over?
      render_game
      game_round(current_player)
      current_player = switch_players(current_player)
    end

    when_game_over(current_player = switch_players(current_player))

  end

  #>????
  private

    def render_game
      @board.render
    end

    def game_round(current_player)
      input = current_player.get_input
      if player_quit?(input)
        game_over?
      else
        piece = current_player.piece
        @board.update_board(input, piece)
        render_game
        print "\n"
      end
    end

    def game_over?
      if @board.win_condition? || @board.tie?
        return true
      elsif @player1.quit == true || @player2.quit == true
        print "Player quit"
        return true
      else
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
      elsif @board.tie?
        puts "Tie game!"
        return true
      else
      end
    end

end


class GameBoard

  attr_accessor :game_board_arr

  def initialize
    @game_board_arr = []
    create_board
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

  def update_board(column_input, piece)

      @game_board_arr[column_input].push(piece)
    
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

  def tie?
    tie_count = 0
    @game_board_arr.each do |row|
      if row.length == 6
        tie_count += 1
      end
    end
    if tie_count == 7
      return true
    else
      return false
    end
  end


  private

    def create_board
      7.times do 
        row =[] 
        @game_board_arr.push(row)
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

      test_array = []
      row_index = 0
      row = 0
      while row_index < 6
        @game_board_arr.each do 
          test_array.push(@game_board_arr[row][row_index])
          row += 1
        end

        if winning_array?(test_array)
          return true
        else
          return false
        end
        row_index +=1
        row = 0
      end
    end


    def diagonal_win?
      game_arr_direction = @game_board_arr
       
      2.times do 
        4.times do |column|
          3.times do |row|
            if game_arr_direction[column ]    [row ] != nil && 
              (game_arr_direction[column]    [row   ] == 
               game_arr_direction[column + 1][row + 1] &&
               game_arr_direction[column + 1][row + 1] == 
               game_arr_direction[column + 2][row + 2] &&
               game_arr_direction[column + 2][row + 2] == 
               game_arr_direction[column + 3][row + 3])
      
              return true
            end
          end
        end
        game_arr_direction = @game_board_arr.reverse
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

  attr_reader :name, :piece, :quit

  def initialize(name, piece, board)
    @name = name
    @piece = piece
    @board = board
    @quit = false
  end


  def get_input
    puts "Enter the column below"
    print ">>"
    input = gets.chomp
    if player_quit?(input)
      @quit = true
      return input
    else
      input = input.to_i - 1
      unless is_valid?(input)
        until is_valid?(input)
          puts "Invalid Entry. Please enter an integer from 1-6"
          print ">>"
          input = gets.chomp
          if player_quit?(input)
            @quit = true
            return input
          else
            input = input.to_i - 1
          end
        end
      end
    end
    input
  end

  private

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


