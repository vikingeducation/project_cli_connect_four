class PegSystem

  def initialize(peg_symbol, board)
    @peg_symbol = peg_symbol
    @board = board
    @peg_peg_peg_peg =  [@peg_symbol, @peg_symbol, @peg_symbol, @peg_symbol]
    @peg_peg_peg_empty = [@peg_symbol, @peg_symbol, @peg_symbol, nil]
    @peg_peg_empty_peg = [@peg_symbol, @peg_symbol, nil, @peg_symbol]
    @peg_empty_peg_peg = [@peg_symbol, nil, @peg_symbol, @peg_symbol]
    @empty_peg_peg_peg = [nil, @peg_symbol, @peg_symbol, @peg_symbol]
  end

  def four_pegs_vertically?
    board_rotated_90deg.any? {|row| detect_pattern_in_array(row, @peg_peg_peg_peg)}
  end

  def four_pegs_horizontally?
    @board.board.any? {|row| detect_pattern_in_array(row, @peg_peg_peg_peg) != nil}
  end

  def four_pegs_diagonally?
    north_east_diagonals_array.any? {|row| detect_pattern_in_array(row, @peg_peg_peg_peg)}||
    south_east_diagonals_array.any? {|row| detect_pattern_in_array(row, @peg_peg_peg_peg)}
  end

  def three_pegs_vertically?
    board_rotated_90deg.each_with_index do |col, col_idx|
      if detect_pattern_in_array(col, @empty_peg_peg_peg) && col[0] == nil
        return col_idx + 1
      end
    end
    return nil
  end

  def three_pegs_horizontally?
    potential_guess = []
    @board.board.each_with_index do |row, row_idx|
      case
      when detect_pattern_in_array(row, @peg_peg_peg_empty)
        potential_guess = [row_idx, detect_pattern_in_array(row, @peg_peg_peg_empty) + 3]
      when detect_pattern_in_array(row, @peg_peg_empty_peg)
        potential_guess = [row_idx, detect_pattern_in_array(row, @peg_peg_empty_peg) + 2]
      when detect_pattern_in_array(row, @peg_empty_peg_peg)
        potential_guess = [row_idx, detect_pattern_in_array(row, @peg_empty_peg_peg) + 1]
      when detect_pattern_in_array(row, @empty_peg_peg_peg)
        potential_guess = [row_idx, detect_pattern_in_array(row, @empty_peg_peg_peg)]
        puts "DBG: potential_guess = #{potential_guess.inspect}"
      end
      space_under_slot?(potential_guess) ? (break) : potential_guess = []
    end
    potential_guess.any? ? potential_guess[1] + 1 : nil
  end

  def three_pegs_diagonally?
    three_pegs_north_east_diagonally?  || three_pegs_south_east_diagonally?
  end

  def winning_connected_four
    four_pegs_horizontally? ||
    four_pegs_vertically? ||
    four_pegs_diagonally?
  end

  private


  def south_east_diagonals_array
    se_diagonals = Array.new(6){Array.new}
       0.upto(5) do |diag|
        se_diagonals[0] << @board.board[2 + diag][diag] if diag <= 3
        se_diagonals[1] << @board.board[1 + diag][diag] if diag <= 4
        se_diagonals[2] << @board.board[diag][diag]
        se_diagonals[3] << @board.board[diag][1 + diag]
        se_diagonals[4] << @board.board[diag][2 + diag] if diag <= 4
        se_diagonals[5] << @board.board[diag][3 + diag] if diag <= 3
      end
      se_diagonals
  end

  def north_east_diagonals_array
    ne_diagonals = Array.new(6){Array.new}
    5.downto(0) do |diag|
      ne_diagonals[0] << @board.board[diag - 2][5 - diag]
      ne_diagonals[1] << @board.board[diag - 1][5 - diag]
      ne_diagonals[2] << @board.board[diag][5 - diag]
      ne_diagonals[3] << @board.board[diag][6 - diag]
      ne_diagonals[4] << @board.board[diag][7 - diag] if diag >= 1
      ne_diagonals[5] << @board.board[diag][8 - diag] if diag >= 2
    end
    ne_diagonals
  end

  def space_under_slot?(coord)
    if coord.any?
      row_beneath = coord[0]
      row_beneath < 5 ? !@board.slot_empty?(row_beneath + 1,coord[1] + 1) : true
    end
  end

  def detect_pattern_in_array(array, combination)
    0.upto(array.size - combination.size) do |position|
      if array[position...(position + combination.size)] == combination
        return position
      end
    end
    return nil
  end

  def board_rotated_90deg
    board_vertical = []
    6.times do |column|
      new_row = []
      @board.board.each {|row| new_row << row[column]}
      board_vertical << new_row
    end
    board_vertical
  end

  def shift_se_diagonal_to_get_board_coord(row_idx)
    case row_idx
    when 0
      [2,0]
    when 1
      [1,0]
    when 2
      [0,0]
    when 3
      [0,1]
    when 4
      [0,2]
    when 5
      [0,3]
    end
  end

  def three_pegs_south_east_diagonally?
    potential_guess = []
    south_east_diagonals_array.each_with_index do |row, row_idx|
      x = shift_se_diagonal_to_get_board_coord(row_idx)[0]
      y = shift_se_diagonal_to_get_board_coord(row_idx)[1]
      potential_guess = diagonal_conditions(-1,row,x,y) || []
      space_under_slot?(potential_guess) ? (break) : potential_guess = []
    end
    potential_guess.any? && !@board.board[0][potential_guess[1]] ? potential_guess[1] + 1 : nil
  end

  def shift_ne_diagonal_to_get_board_coord(row_idx)
    case row_idx
    when 0
      [-3,0]
    when 1
      [-4,0]
    when 2
      [-5, 0]
    when 3
      [-5, 1]
    when 4
      [-5, 2]
    when 5
      [-5, 3]
    end
  end

  def three_pegs_north_east_diagonally?
    potential_guess = []
    north_east_diagonals_array.each_with_index do |row, row_idx|
      x = shift_ne_diagonal_to_get_board_coord(row_idx)[0]
      y = shift_ne_diagonal_to_get_board_coord(row_idx)[1]
      potential_guess = diagonal_conditions(1,row,x,y) || []
      space_under_slot?(potential_guess) ? (break) : potential_guess = []
    end
    potential_guess.any? && !@board.board[0][potential_guess[1]] ? potential_guess[1] + 1 : nil
  end


  def diagonal_conditions(calibrator,row,x,y)
    case
    when detect_pattern_in_array(row, @peg_peg_peg_empty)
      [detect_pattern_in_array(row, @peg_peg_peg_empty) - (3 + x)*calibrator, detect_pattern_in_array(row, @peg_peg_peg_empty) + 3 + y]
    when detect_pattern_in_array(row, @peg_peg_empty_peg)
      [detect_pattern_in_array(row, @peg_peg_empty_peg) - (2 + x)*calibrator, detect_pattern_in_array(row, @peg_peg_empty_peg) + 2 + y]
    when detect_pattern_in_array(row, @peg_empty_peg_peg)
      [detect_pattern_in_array(row, @peg_empty_peg_peg) - (1 + x)*calibrator, detect_pattern_in_array(row, @peg_empty_peg_peg) + 1 + y]
    when detect_pattern_in_array(row, @empty_peg_peg_peg)
      [detect_pattern_in_array(row, @empty_peg_peg_peg) - x*calibrator, detect_pattern_in_array(row, @empty_peg_peg_peg) + y]
    end
  end
end