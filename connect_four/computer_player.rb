class ComputerPlayer
  attr_accessor :peg_symbol, :board, :name, :competitors_peg

  def initialize(name, peg_symbol, board, peg_system_competitor, peg_system_computer)
    @name = name
    @peg_symbol = peg_symbol
    @board = board
    @competitors_peg = competitors_peg
    @peg_system_competitor = peg_system_competitor
    @peg_system_computer = peg_system_computer
  end

  def get_col_guessed
    loop do
      col_guessed = @peg_system_computer.three_pegs_vertically? || @peg_system_computer.three_pegs_horizontally? || 
              @peg_system_computer.three_pegs_diagonally? || @peg_system_competitor.three_pegs_vertically? || 
              @peg_system_competitor.three_pegs_horizontally? || @peg_system_competitor.three_pegs_diagonally? || 
              rand(1..7)
      if @board.can_drop_peg_here?(col_guessed)
        @board.add_pegs(col_guessed, peg_symbol)
        break
      end
    end
  end

end