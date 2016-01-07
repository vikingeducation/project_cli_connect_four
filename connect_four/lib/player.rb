
# Class: Player
# symbol
# symbol=
# column
# column=
# name
# initialize
# choose_symbol
# choose_column

class Player
  attr_accessor :symbol, :column
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def choose_symbol
    @symbol = gets.chomp.upcase
    choose_symbol unless ["X", "O"].include?(@symbol)
  end

  def choose_column
    puts "It's #{@name}'s turn, your piece is #{@symbol}"
    puts "Which column do you want to place your piece? (1-7)"
    @column = gets.chomp.to_i - 1
    choose_column unless (0..6).include?(@column)
  end
end