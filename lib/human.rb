class Human < Player

  def make_move
    puts "where would you like to move? (column # 1-7)"
    column = gets.chomp.to_i - 1
    until check_move_valid?(column)
      puts "Please enter a valid number between 1 and 7"
      column = gets.chomp.to_i - 1
    end
    @board.update_board(column, @color)
  end


  ###If time permits, move this in board
  def check_move_valid?(column)
    column.between?(0,6)
  end

end