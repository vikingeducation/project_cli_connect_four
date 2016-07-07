module ConnectFour
  class Board

    def initialize
      @board = Array.new(7) { Column.new }      
    end

    def add_piece(column_num, player_color)
      @board[column_num].pieces.push(player_color)
    end

  end
end