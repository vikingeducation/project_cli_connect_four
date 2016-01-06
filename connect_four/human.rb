class Human < Player

  def select_move
    puts "Please select the column: "
    column = gets.chomp
    if validate_column?(column)
      return column
    else
      puts "Invalid column"
      select_move
    end
  end

  def validate_column?(column)
    [1..7].include?(column)
  end

end