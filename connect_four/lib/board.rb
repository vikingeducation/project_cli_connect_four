# public methods: grid, cols, check_winner(col_idx, disk_inserted), full?
# private methods: count_4_dir, count
# test #initialize -  returns Board
# test #grid has array of Stacks
# test #cols - number of columns
# test #full?
# test #check_winner(col_idx, disk_inserted)
require 'pry'
class Board
  DIRECTIONS = { up:         { stack:  0, index:  1 },
                 down:       { stack:  0, index: -1 },
                 up_left:    { stack: -1, index:  1 },
                 down_right: { stack: -1, index: -1 },
                 up_right:   { stack:  1, index:  1 },
                 down_left:  { stack: -1, index: -1 },
                 left:       { stack: -1, index:  0 },
                 right:      { stack:  1, index:  0 } }.freeze

  attr_reader :cols, :grid, :rows
  def initialize(cols, rows)
    @cols = cols
    @rows = rows
    @grid = []
    cols.times { @grid << Stack.new(rows) }
  end

  def render(opts = { clear: false })
    system "clear" if opts[:clear]
    puts
    (0..@rows - 1).to_a.reverse_each do |i|
      @grid.each do |col|
        print col.stack[i]
      end
      print "\n"
    end
    puts "-----------" * 10
    (0..@cols - 1).each do |j|
      print "\tColumn #{j}"
    end
    print "\n"
  end

  def check_winner(col_idx, disk_inserted, marker = nil)
    new_disk_pos = if disk_inserted
                     { stack: col_idx, index: @grid[col_idx].tos - 1 }
                   else
                     { stack: col_idx, index: @grid[col_idx].tos }
                   end
    count_4_dir(new_disk_pos, marker).values.any? { |v| v == 4 }
  end

  def full?
    @grid.all? { |item| item.tos == rows}
  end

  private

  def count_4_dir(disk_pos, marker)
    count_8 = {}
    count_4 = {}
    # Traverse 4 positions in all 8 directions, until we encounter nil/end/another_marker
    # @current_player is winner
    # if count of [:up + :down], [:up-left + :down-right], [:up-right + :down-left], [:left + :right] == 4
    DIRECTIONS.keys.each do |dir|
      count_8[dir.to_sym] = count(dir.to_sym, disk_pos, marker)
    end
    count_4[:vertical] = count_8[:up] + count_8[:down] + 1
    count_4[:horizontal] = count_8[:left] + count_8[:right] + 1
    count_4[:left_diagonal] = count_8[:up_left] + count_8[:down_right] + 1
    count_4[:right_diagonal] = count_8[:up_right] + count_8[:down_left] + 1
    count_4
  end

  def count(dir_sym, disk_pos, marker)
    stack = disk_pos[:stack]
    index = disk_pos[:index]
    stack_incr = DIRECTIONS[dir_sym][:stack]
    index_incr = DIRECTIONS[dir_sym][:index]
    count = 0
    cur_disk = @grid[stack].stack[index]
    3.times do
      stack += stack_incr
      index += index_incr
      # Break if out of bounds
      break if stack < 0 || stack > 6 || index < 0 || index > 5
      # Break if disk does not match
      break if @grid[stack].stack[index] != (marker ? Disk.new(marker) : cur_disk)
      count += 1
    end
    count
  end
end
