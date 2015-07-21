class Tower_make
  attr_reader :tower_struct
  attr_writer :num
  
  def initial
    @num = 0
    @tower_struct = {}
  end
  
  def make
    puts"Game begin"
    puts"how large the tower do you want?"
    while @num<3||@num>6#||(@num.class != Fixnum)
      puts"enter a number between 3 and 6, otherwise you can not continue the game:"
      @num = gets.chomp.to_i
    end
  end
  
  def get
    @tower_struct["1"] = []
    (@num+1).downto(1) do |item|
      @tower_struct["1"] << item
    end
    @tower_struct["2"] = [@num+1]+[0]*(@num)
    @tower_struct["3"] = @tower_struct["2"]
    @tower_struct
  end
  
end

class TowerPrint
  attr_writer :tower_struct
  
  def init
    @tower_struct = {}
  end
  
  def getdata(tower_struct)
    @tower_struct = tower_struct
    puts"get finish"
    puts @tower_struct
  end
  
  def draw
    i = @tower_struct["1"].length - 1
    j = i
    puts i
    puts"draw begin"
    while i>=0
      @tower_struct.each do |key, array|
        print "#" * @tower_struct[key][i] + " " * (@tower_struct["1"].length * 2 - @tower_struct[key][i])
      end
      i -= 1
      puts""
    end
    puts"draw end"
  end
  
end


class MoveTower
  attr_accessor :tower_struct, :fromT, :toT
  
  def getdata(tower_struct, move_array)
    @tower_struct = tower_struct
    @fromT = move_array[0].to_s
    @toT = move_array[1].to_s
  end
  
  def move
    t1 = @tower_struct[@fromT].select {|item| item>0}
    t2 = @tower_struct[@toT].select {|item| item>0}
    
    if (t1[-1] < t2[-1]) 
      t2 << t1.pop
      t1 = t1 + [0]*(@tower_struct[@fromT].length - t1.length)
      t2 = t2 + [0]*(@tower_struct[@fromT].length - t2.length)
      @tower_struct[@fromT] = t1
      @tower_struct[@toT] = t2
    else
      puts"the input step is illegal"
    end
  end
    
  def get
    @tower_struct
  end
  
end

class MoveInput
  attr_accessor :move_array
  Choice = ["1","2","3","q"]
  
  def init
    @move_array = []
  end
  
  def input
    
    puts "input the from tower you want(a number between 1 and 3, you can choose q to quit  "
    @move_array[0] = ""
    while !Choice.include?(@move_array[0]) do
      print"input a from tower number   "
      @move_array[0] = gets.chomp
      puts""
    end
    if @move_array[0] == "q"
      abort("You quit the game")
    end
    
    puts "input the target tower you want(a number between 1 and 3, you can choose q to quit  "
    @move_array[1] = ""
    while !Choice.include?(@move_array[1]) do
      print"input a target tower number   "
      @move_array[1] = gets.chomp
      puts""
    end
    
    if @move_array[1] == "q"
      abort("You quit the game")
    end
    
    print @move_array.map{|item| item = item.to_i}
    @move_array.map{|item| item = item.to_i}
    
  end 
  
end

class HoiGame
  attr_accessor :towermake, :towerdraw, :towerformat, :win, :gamein, :movestep, :towermove, :win
  
  def play
    #intialize the tower size
    @win = 0
    @towermake = Tower_make.new
    @towermake.initial
    @towermake.make
    @towerformat = @towermake.get
    a = @towerformat["1"]
    #draw the first tower
    @towerdraw = TowerPrint.new
    @towerdraw.init
    @towerdraw.getdata(@towerformat)
    @towerdraw.draw
    #begin the game
    @towermove = MoveTower.new
    @gamein = MoveInput.new
    while @win == 0 do
      @gamein.init
      puts "init finished"
      @movestep = @gamein.input
      puts "movestep finished"
      @towermove.getdata(@towerformat,@movestep)
      @towermove.move
      @towerformat = @towermove.get
      puts @towerformat
      @towerdraw.getdata(@towerformat)
      @towerdraw.draw
      if(towerformat["3"]==a)
        puts"you win, game end"
        @win = 1
      end
    end
  
  end
end
    
    
G = HoiGame.new
G.play

#I = MoveInput.new
#I.init
#print(I.input)
#D = TowerPrint.new
#moving = MoveTower.new
#moving.getdata({"1"=>[4, 3, 2, 1], "2"=>[4, 0, 0, 0], "3"=>[4, 3, 0, 0]}, [3,2])
#moving.move
#D.getdata(moving.get)
#D.draw
#T = Tower_make.new
#T.initial
#T.make
#puts T.get
#puts"anything"
#D = TowerPrint.new
#D.init
#D.getdata({"1"=>[4, 3, 2, 1], "2"=>[4, 3, 2, 1], "3"=>[4, 3, 2, 1]})
#D.draw