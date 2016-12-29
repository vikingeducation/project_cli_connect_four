class Human < Player
  def get_move(board_data)
    print "#{self.name}'s move > "
    valid_moves = determine_valid_moves(board_data)
    input = gets.chomp
    until valid_moves.include?(input)
      return 'q' if input == 'q'
      puts "Invalid move! Valid moves are #{valid_moves.join(', ')}!"
      input = gets.chomp
    end
    input.to_i
  end
end