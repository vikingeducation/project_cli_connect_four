class BoardView
  def self.render(board)
    puts
    board.rows.each do |row|
      row.each do |cell|
        print cell.nil? ? "|   " : "| #{cell} "
      end
      print "|"
      puts
    end
    puts "-----------------------------"
    puts "| 1 | 2 | 3 | 4 | 5 | 6 | 7 |"
    puts
  end

end
