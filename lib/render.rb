class Render
  def self.board(board)
    clear
    spacing
    column_numbers
    board.each do |row|
      format_cells(row)
    end
    column_numbers
    spacing
  end

  def self.winner(player)
    puts "########GAMER OVER########\n\n"
    puts "#{player} wins!\n\n"
  end

  private

    def self.clear
      system("cls") || system("clear") || puts("\e[H\e[2J")
    end

    def self.column_numbers
      puts "- 1 - 2 - 3 - 4 - 5 - 6 - 7 -"
    end

    def self.format_cells(row)
      row.each do |cell|
        print "| #{(cell || " ")} "
      end
      puts "|"
    end

    def self.placement
      puts "Enter the column in which you want to place a piece"
    end

    def self.spacing
      puts "\n\n"
    end
end