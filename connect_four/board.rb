# board.rb

class Board
  attr_reader :board

  def initialize
    @board = Array.new(7) { Array.new(6, "_") }
  end

  def render
    puts render_board
  end

  def receive_move?(move)
    if available?(move)
      column, piece = move
      index_of_empty_space = board[column].index("_")
      board[column][index_of_empty_space] = piece
      true
    else
      false
    end
  end

  def game_over?

  end

  private

  def render_board
    output = ""
    5.downto(0) do |index|
      board.each { |column| output << " #{column[index]} |" } 
      output << "\n"
    end
    output
  end

  def available?(move)
    column, _ = move
    board[column].any? { |item| item == "_" }
  end

  def check_winner?
  end

  def check_tie?
  end

end

