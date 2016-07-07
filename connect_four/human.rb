class Human < Player

  def make_move
    puts "where would you like to move? (column # 1-7)"
    column = gets.chomp.to_i-1
    @board.put_piece(column, @color)
  end

end