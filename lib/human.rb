class Human < Player

  def make_move(board)
    get_move while !assign_move(board)
  end

  def get_move
    puts "Where do you want to move? (1-7)"
  end

  def assign_move(board)
    column = gets.chomp.to_i - 1
    valid_entry?(column) ? board.add_piece(@color, column) : false
  end

  def valid_entry?(column)
    (0..6).include?(column)
  end

end
