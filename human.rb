class Human < Player

  def make_move(board)
    get_move until assign_move(board)
  end

  def get_move
    puts "Where do you want to move"
  end

  def assign_move(board)
    column = gets.chomp
    valid_entry?(column) ? board[column] << @color = column : false
  end

  def valid_entry?(column)
    (1..7).include?(column)
  end

end
