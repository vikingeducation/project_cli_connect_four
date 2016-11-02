class Render
  def self.board(board)
    puts "\n- 1 - 2 - 3 - 4 - 5 - 6 - 7 -"
    5.downto(0) do |i|
      board.each do |column|
        print "| #{(column[i] || " ")} "
      end
      puts "|"
    end
    puts "- 1 - 2 - 3 - 4 - 5 - 6 - 7 -\n\n"
  end
  def self.weird board
    p board
  end
end