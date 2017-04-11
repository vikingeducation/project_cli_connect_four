=begin

Public interface:

:name (reader)
:disc (reader)
initialize(name = "Anonymous", disc, grid)
get_choice

=Private methods=

ask_for_column
valid_column_number?(column)

=Paths=

  initialize
    -creates instance
    -creates all instance variables

  :name (reader)
    -returns the name

  :disc (reader)
    -returns the disc

  get_choice
    -loops until valid choice is entered and piece is added to board

  ask_for_column
    -prints correct instructions
    -gets user input
    -converts user input to integer

  valid_column_number?
    -returns true if column numbers is withing the range of the board (1-7)
    -prints error message if it's not

=end

class Player

  attr_reader :name, :disc

  def initialize(name, disc, grid)
    
    @name = name 
    @disc = disc
    @grid = grid

  end

  def get_choice

    loop do
      column = ask_for_column - 1

      break if valid_column_number?(column) && @grid.add_piece(column, @disc)
    end

  end

  private

  def ask_for_column
    
    puts
    puts "#{@name}, enter the column (1-7) that you want to put your disc (#{@disc}) in."
    gets.strip.to_i

  end

  def valid_column_number?(column)
    
    if (0..6).include?(column)
    	true
    else
    	puts "Your column of choice is not within the allowed range (1-7)."
    end

  end

end
