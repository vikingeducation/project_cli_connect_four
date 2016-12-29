module AI
  def next_move(all_scores, all_scores_opponent, valid_moves)
    # win
    if all_scores.max == 50
      # p "I win!"
      next_move = best_moves(all_scores, valid_moves)[0]
      return [next_move + 1, 'best']
    # prevent opponent from wining
    elsif all_scores_opponent.max == 50 
      display_evil_message
      next_move = best_moves(all_scores_opponent, valid_moves)[0]
      return [next_move + 1, 'best']
    # prefer moves that maximize own score (if own score greater than opponent's score)
    elsif all_scores.max >= all_scores_opponent.max
      # prefer move that is closer to 3 (middle)
      best_moves = best_moves(all_scores, valid_moves)
      index_move_closest_to_middle = best_moves.map {|e| (e-3).abs}.each_with_index.min[1]
      next_move = best_moves[index_move_closest_to_middle]
    # prefer moves that minimize opponent score (if own score less than opponent's score)
    elsif all_scores_opponent.max > all_scores.max
      # prefer move that is closer to 3
      best_moves_opponent = best_moves(all_scores_opponent, valid_moves)
      index_move_closest_to_middle = best_moves_opponent.map {|e| (e-3).abs}.each_with_index.min[1]
      next_move = best_moves_opponent[index_move_closest_to_middle]
    end
    next_move + 1
  end

  def best_moves(scores_array, valid_moves)
    best_moves = []
    scores_array.each_with_index do |score, index|
      best_moves << valid_moves[index] if score == scores_array.max
    end
    best_moves
  end

  def compute_scores_array(valid_moves, board_data, value)
    scores =[]
    valid_moves.each do |move|
      scores << total_score(board_data, move, value)
    end
    scores
  end

  def total_score(board_data, next_x, value)
    next_y = find_y_pos_of_next_move(board_data, next_x) 
    vs = vertical_score(board_data, next_x, next_y, value)  
    hs = horizontal_score(board_data, next_x, next_y, value) 
    drs = diagonal_right_score(board_data, next_x, next_y, value) 
    dls = diagonal_left_score(board_data, next_x, next_y, value) 
    return 50 if vs > 3 || hs > 3 || drs > 3 || dls > 3  # 50 => 'win'
    total_score = vs + 2*hs + 2*drs + 2*dls  # weighting => horizontal and diagonal moves preferred
  end

  def find_y_pos_of_next_move(board_data, next_x)
    board_data.each_with_index do |row, row_index|
      return row_index if row[next_x] == 0
    end
  end

  def vertical_score(board_data, next_x, next_y, value)
    score = 1
    # check down
    down = next_y - 1
    until down < 0 
      board_data[down][next_x] == value ? score += 1 : break
      down -= 1
    end 
    score 
  end

  def horizontal_score(board_data, next_x, next_y, value)
    score = 1
    left = next_x - 1
    right = next_x + 1
    # check left
    until left < 0
      board_data[next_y][left] == value ? score += 1 : break
      left -= 1
    end
    # check right
    until right > 6
      board_data[next_y][right] == value ? score += 1 : break
      right += 1
    end
    score
  end

  def diagonal_left_score(board_data, next_x, next_y, value)
    score = 1
    # check left & down
    left = next_x - 1
    down = next_y - 1
    until left < 0 || down < 0
      board_data[down][left] == value ? score += 1 : break
      left -= 1
      down -= 1
    end
    # check right & up
    right = next_x + 1
    up = next_y + 1
    until right > 6 || up > 5
      board_data[up][right] == value ? score += 1 : break
      right += 1
      up += 1
    end
    score
  end

  def diagonal_right_score(board_data, next_x, next_y, value)
    score = 1
    # check right & down
    right = next_x + 1
    down = next_y - 1
    until right > 6 || down < 0
      board_data[down][right] == value ? score += 1 : break
      right += 1
      down -= 1
    end
    # check left & up
    left = next_x - 1
    up = next_y + 1
    until left < 0 || up > 5
      board_data[up][left] == value ? score += 1 : break
      left -= 1
      up += 1
    end
    score
  end

  def display_evil_message
    choice = rand(4)
    case choice
    when 1 
      puts "Not today, human!"
    when 2
      puts "The robots are taking over!"
    when 3
      puts "Haha, I stopped you from winning!"
    end
  end
end