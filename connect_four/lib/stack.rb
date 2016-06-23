# public methods: stack, tos, tos=, insert_disk(marker)
# private methods : -
# test #initialize with rows, 0
# test #stack -
# test #tos - is always <= max
# test #insert_disk(marker)

class TOS_Overflow < StandardError
  def initialize(msg="StackOverflow")
    super(msg)
  end
end

class Stack
  attr_reader :stack, :tos
  def initialize(rows)
    @stack = []
    rows.times { @stack << Disk.new }
    @tos = 0
    @max = 5
  end

  def insert_disk(marker)
    if @tos <= @max
      disk = Disk.new(marker)
      @stack[@tos] = disk
      @tos += 1
    else
      # puts "Failed to insert_disk disk, stack overflow!"
      # raise TOS_Overflow.new
      nil
    end
  end
end

