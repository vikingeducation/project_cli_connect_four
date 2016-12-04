module Display

  def display_board
    (1..7).to_a.reverse.each{ |row| puts get_row(row).values.to_s }
  end

  def player_msg(player)
    puts "#{player}, where is your move?"
  end

  def ask_name_msg
    puts "What is your name?"
  end
end
