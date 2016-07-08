module ConnectFour
  class Game
    def initialize(rows,columns)
      @board = Board.new(rows,columns)
      welcome_message
      initialize_players
    end 

    def welcome_message
      puts "Welcome to connect four. How many players?"
    end

    def initialize_players
      input = gets.chomp
      if input == "1"
        @player1 = Human.new(1)
        @player2 = Computer.new(2)
      elsif input == "2"
        @player1 = Human.new(1)
        @player2 = Human.new(2)
      else
        puts "Please enter '1' or '2'."
        initialize_players
      end
    end

    def play
      loop do

        @board.render
        turn(@player1)

        @board.render
        turn(@player2)

      end
    end

    def turn(player)
      p_move = player.move
      while @board.col_full?(p_move)
        p_move = player.move
      end
      @board.add_piece(p_move, player.piece)
      game_over if game_over?
    end

    def game_over
      puts "Game over"
      exit
    end

    def game_over?
      win? || full?
    end

    def win? 
      verticals || horizontals || diagonals
    end

    def verticals
      @board.board.each do |column|
        idx=0
        while idx < column.max_length - 3
          #create a subarray starting at idx with length 4
          sub_arr = column.pieces[idx, 4] 
          #check if all four elements in the subarray are the same
          return true if sub_arr.all? {|e| e == :X} || sub_arr.all?{|e| e==:O} 
          idx+=1
        end
      end
      return false
    end

    def horizontals
      make_horizontals

    end

    def make_horizontals
      horizontals = [] # array of arrays of horizontals
      index = 0
      while index < @board.board[0].max_length
        row = []
        @board.board.each do |column|
          row.push(column.pieces[index])
        end
        horizontals.push(row)
        index += 1
      end
      horizontals
    end

    def diagonals
    end

    def full?
      @board.board.all?{|column|column.full?}
    end

# Classes: Player, Human, Computer, Game, Board, Column
# Board: 7 across, 6 up

# Board should be an array of arrays of Columns

# Player: initialize, get_move
# Human: valid_move? prompt
# Computer: print_choice
# Game: Initialize, play, win?, full?, game_over?
# Board: render, add_piece(location)
# Column: initialize, show



end
end