class Render
  def self.board(board)
    puts "\e[H\e[2J"
    puts "\n\n- 1 - 2 - 3 - 4 - 5 - 6 - 7 -"
    board.each do |row|
      row.each do |cell|
        print "| #{(cell || " ")} "
      end
      puts "|"
    end

    puts "- 1 - 2 - 3 - 4 - 5 - 6 - 7 -\n\n"
  end
  def self.winner(player)
    puts "########GAMER OVER########\n\n"
    puts "#{player} wins!\n\n"
  end
end