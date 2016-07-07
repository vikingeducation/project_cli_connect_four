module ConnectFour
  class Board

    def initialize(rows,columns)
      @board = Array.new(columns) { Column.new(rows) } 
      @rows = rows     
    end

    def add_piece(col_num, player_piece)
      column(col_num).pieces.push(player_piece)
    end

    def column(n)
      @board[n.to_i-1]
    end

    def col_full?(col_num)
      if column(col_num).pieces.length == @rows
        full_col_error
        return true
      else
        return false
      end
    end

    def full_col_error
      puts "That column is full!"
    end

    def render
      #Column data starts at bottom, leftmost in array is bottom in display
      #top-left:at first column.pieces[@max_length]
      #top row: each column.pieces at index @max_length
      #second-top-row:each column.pieces at index @max_length-1
      #and so on until 
      #botom row:each column.pieces at index 0
      i=@board[0].max_length
      while i>=0
        @board.each do |column|
          print (column.pieces[i]||"_")+"|"
        end
        puts
        i-=1
      end
    end

  end
end