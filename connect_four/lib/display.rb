# module Display
#   @color_red = "Red".color(:red)
#   @color_black = "Black".color(:black).background(:white)
#   @r = "R".color(:red)
#   @b = "B".color(:black).background(:white)

#   # display instructions
#   def self.instructions
#     puts "#{"Welcome to Connect Four!".color(:magenta)}"
#     puts "\n- There are two players, #{@color_red} and #{@color_black}."
#     puts "- The goal of the game is to get 4 of a kind in any direction (horizontal, vertical, or diagonal)."
#     puts "- Enter a #{"# between 1 and 7".color(:aqua)} to move your piece to that column."
#     puts "- #{@color_red} goes first."
#     puts "\n"
#   end

#   def self.ask_input
#     puts "Enter column (1-7): "
#   end

#   def self.invalid_input
#     puts "Invalid selection, try again."
#   end

#   # display board between turns
#   def self.render_board(board)
#     board.reverse.each do |row_arr|
#       row_arr.each do |col|
#         print "|"
#         if col == :b
#           print @b
#         elsif col == :r
#           print @r
#         else
#           print " "
#         end
#       end
#       puts "|\n"
#     end
#     print " 1 2 3 4 5 6 7\n"
#   end

#   # display who won
#   def self.game_won(color)
#     puts "#{@color_black} wins!" if color == :b
#     puts "#{@color_red} wins!" if color == :r
#   end

#   def self.game_draw(color)
#     puts "The board is full, game ends in a draw."
#   end

#   def self.ask_replay
#     puts "Would you like to play again? (y/n)"
#   end
# end