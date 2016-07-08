class Display

  def self.welcome
    puts "Welcome to Connect Four!"
  end

  def self.render(grid)
    render_grid(grid)
    render_column_numbers
  end

  def self.fill(arr)
    copy = arr
    copy.each do |x|
      until x.length == 6
        x << "-"
      end
    end
    copy
  end

  def self.render_grid(arr)
    (0..5).to_a.reverse.each do |y|
      (0..6).to_a.each do |x|
        if arr[x][y].nil?
          print "- "
        else
          print arr[x][y] + " "
        end
      end
      print "\n"
    end
  end

  def self.render_column_numbers
    puts (1..7).to_a.join(" ")
  end

end
