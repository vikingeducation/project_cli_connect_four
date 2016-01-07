require_relative 'player.rb'

class Human < Player

  def select_move
    puts "Please select the column: "
    column = gets.chomp.to_i
    if validate_column?(column)
      @column = column
      return column
    else
      puts "Invalid column"
      select_move
    end
  end

  def validate_column?(column)
    (1..7).to_a.include?(column)
  end

end