module ConnectFour
  class Board

    def initialize(rows,columns)
      @board = Array.new(columns) { Column.new(rows) }      
    end

    def add_piece(column_num, player_color)
      @board[column_num].pieces.push(player_color)
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