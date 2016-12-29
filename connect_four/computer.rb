require './ai'

class Computer < Player
  include AI

  def initialize(attributes)
    attributes[:name] = generate_name
    super(attributes)
  end

  def get_move(board_data)
    print "Enter to see #{self.name}'s move > "
    return 'q' if gets.chomp == 'q'
    #
    valid_moves_string_array = determine_valid_moves(board_data)
    valid_moves = valid_moves_string_array.map { |move| move.to_i - 1 }
    #
    self.color == 'red' ? value = 1 : value = -1
    #
    scores = compute_scores_array(valid_moves, board_data, value)
    opponent_scores = compute_scores_array(valid_moves, board_data, value*-1)
    # smarter AI (will making winning move, prevent opponent winning move, prefer certain moves)
    next_move = next_move(scores, opponent_scores, valid_moves)
    # do not run 2nd check if above move is a winning move / prevents a win
    return next_move[0] if next_move.is_a?(Array)
    
    # else, run 2nd check (checks if the move suggested above gets it killed)
    # if it does, re-run next_move (but feed it a valid_move_modified array that does not include faulty move)
    # 
    board_data_dup = duplicate_2D_array(board_data)
    y_pos = find_y_pos_of_next_move(board_data, next_move)
    board_data_dup[y_pos][next_move] = value

    valid_moves_2_string_array = determine_valid_moves(board_data_dup)
    valid_moves_2 = valid_moves_2_string_array.map { |move| move.to_i - 1 }
    opponent_scores_2 = compute_scores_array(valid_moves_2, board_data_dup, value*-1)

    if opponent_scores_2.max == 50
      valid_moves_modified = valid_moves - [next_move]
      next_move = next_move(scores, opponent_scores, valid_moves_modified)
    else
      next_move
    end
  end

  private

  def duplicate_2D_array(array)
    dup_array = []
    array.each { |subarray| dup_array << subarray.dup }
    dup_array
  end 

  def generate_name
    adjectives = %w(
      Bitter Expensive Giant Purple Silver Patient Red Budget Standard Upset Fun 
      Fat Stupid Smart Dirty Yellow Nasty Illegal Strange Crazy Sharp Wise Amazing
      Cheap Secret Classic White Blue Fast Green Cold Hot Mad Curious Angry Boring
    )
    nouns = %w(Android Machine Automation Cyborg Bot Robot Mech Puppet Clone Contraption)
    name = "#{adjectives.sample}#{nouns.sample}"
  end
end