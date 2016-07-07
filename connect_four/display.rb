class Display

  def self.render(grid)
    copy = fill(grid)
    render_grid(grid)
    render_column_numbers
  end

  def self.fill(grid)
    copy = grid
    copy.each do |x|
      until x.length == 6
        x << "-"
      end
    end
    copy
  end

  def self.render_grid(grid)
    (0..5).to_a.reverse.each do |y|
      (0..6).to_a.each do |x|
        print grid[x][y] + " "
      end
      print "\n"
    end
  end

  def self.render_column_numbers
    puts (1..7).to_a.join(" ")
  end

end
