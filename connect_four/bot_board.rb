class BotBoard < Board
  def remove_piece(last_move)
    @layout[last_move[0]][last_move[1]] = "_"
  end
end