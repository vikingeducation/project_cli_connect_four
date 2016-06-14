module ConnectFour
  class Stack
    attr_accessor :stack, :tos
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
        puts "Failed to insert_disk disk, stack overflow!"
        nil
      end
    end
  end
end
