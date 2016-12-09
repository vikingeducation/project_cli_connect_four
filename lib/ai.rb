require_relative 'board'
require_relative 'player'
require 'pry'

class AI < Player

# all columns that are not yet full
  def available_moves
    possible_columns = []
    (0..6).each do |i|
      possible_columns << i if @board.columns[i].include?('-')
    end
    possible_columns
  end

# look for 3 pieces in a row
  def better_moves
    candidates = []
    available_moves.each do |i|
      row_index = @board.columns[i].index('-')
      candidates << i if @board.columns[i].join.include?("OOO" || "XXX") || @board.rows(row_index).join.include?("OOO" || "XXX")
    end
    candidates
  end

  def choose_column
    first_choice = better_moves
    player_choice = 0
    if first_choice.empty?
      player_choice = available_moves.sample
    else
      player_choice = first_choice.sample
    end
    puts
    puts "Player #{@number} chose column #{player_choice}!"
    @board.process_choice(player_choice, @piece)
  end

end
