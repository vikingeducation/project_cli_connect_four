class Scoreboard
  attr_writer :win
  def init
    @win = 0
  end

    def check(a,b,c,d,e,f,g,sign)
        win_check = []
        mid = []

        (3..5).each do |i|
          mid = [a[i], b[i-1], c[i-2], d[i-3]]
          win_check << mid
          mid = [b[i], c[i-1], d[i-2], e[i-3]]
          win_check << mid
          mid = [c[i], d[i-1], e[i-2], f[i-3]]
          win_check << mid
          mid = [d[i], e[i-1], f[i-2], g[i-3]]
          win_check << mid
          mid = [g[i], f[i-1], e[i-2], d[i-3]]
          win_check << mid
          mid = [f[i], e[i-1], d[i-2], c[i-3]]
          win_check << mid
          mid = [e[i], d[i-1], c[i-2], b[i-3]]
          win_check << mid
          mid = [d[i], c[i-1], b[i-2], a[i-3]]
          win_check << mid
        end

        (0..5).each do |i|
          mid = [a[i], b[i], c[i], d[i]]
          win_check << mid
          mid = [b[i], c[i], d[i], e[i]]
          win_check << mid
          mid = [c[i], d[i], e[i], f[i]]
          win_check << mid
          mid = [d[i], e[i], f[i], g[i]]
          win_check << mid
        end

        (0..2).each do |i|
          mid = [a[i], a[i+1], a[i+2], a[i+3]]
          win_check << mid
          mid = [b[i], b[i+1], b[i+2], b[i+3]]
          win_check << mid
          mid = [c[i], c[i+1], c[i+2], c[i+3]]
          win_check << mid
          mid = [d[i], d[i+1], d[i+2], d[i+3]]
          win_check << mid
          mid = [e[i], e[i+1], e[i+2], e[i+3]]
          win_check << mid
          mid = [f[i], f[i+1], f[i+2], f[i+3]]
          win_check << mid
          mid = [g[i], g[i+1], g[i+2], g[i+3]]
          win_check << mid
        end

      5.downto(0).each do |i| 
        print "#{a[i]}  #{b[i]}  #{c[i]}  #{d[i]}  #{e[i]}  #{f[i]}  #{g[i]}\n"
        end
        print "A  B  C  D  E  F  G\n"
      #win_check.each do |item| 
      #  print(item) 
       # puts("")
      #end

      win_check.each do |item|
        if item == [sign,sign,sign,sign]
          abort"#{sign} holder win" 
          @win = 1
         end
    end   

    def getwin
      @win
    end

end

class Settle
  attr_accessor :array
  
  def inject(array, sign)
    id = array.index(0)
    array[id] = sign if id != nil
    puts"column full, try another column" if id == nil
    @array = array
    @array
  end
  
  
end

class Game
  attr_accessor :win
  
  def init
    @win = 0
  end
  
  def menu
    puts "which modes, do you want to play, A for beating AI and B for play with a friend"
    input = gets.chomp
    while !["A", "B"].include?(input)
      puts "you enter the wrong number, enter again"
      input = gets.chomp
    end
    ai_start if input == "A"
    start if input == "B"
    
  end
  
  def ai_start
    a = [0, 0, 0, 0, 0, 0]
    b = [0, 0, 0, 0, 0, 0]
    c = [0, 0, 0, 0, 0, 0]
    d = [0, 0, 0, 0, 0, 0]
    e = [0, 0, 0, 0, 0, 0]
    f = [0, 0, 0, 0, 0, 0]
    g = [0, 0, 0, 0, 0, 0]
    puts "connect_four start"
    puts "user1 ---- #, AI ---- X"
    settle = Settle.new
    check = Scoreboard.new
    check.check(a,b,c,d,e,f,g,"#")
    while (@win == 0) do
      puts"user, it's your turn,choose a column from A to G(Caution, use uppercase word)"
      t = gets.chomp 
      while (!["A","B","C","D","E","F","G"].include?(t)) do
        print"the input is not available, enter another"
        t = gets.chomp
      end
      a = settle.inject( a, "#" ) if t == "A"
      b = settle.inject( b, "#" ) if t == "B"
      c = settle.inject( c, "#" ) if t == "C"
      d = settle.inject( d, "#" ) if t == "D"
      e = settle.inject( e, "#" ) if t == "E"
      f = settle.inject( f, "#" ) if t == "F"
      g = settle.inject( g, "#" ) if t == "G"
      print "\n"
      check.init
      check.check(a,b,c,d,e,f,g,"#")
      @win = check.getwin
      puts"it's AI's turn"
      print "\n"
      t = ["A","B","C","D","E","F","G"].sample
      puts"AI: I choose column #{t}"
      a = settle.inject( a, "X" ) if t == "A"
      b = settle.inject( b, "X" ) if t == "B"
      c = settle.inject( c, "X" ) if t == "C"
      d = settle.inject( d, "X" ) if t == "D"
      e = settle.inject( e, "X" ) if t == "E"
      f = settle.inject( f, "X" ) if t == "F"
      g = settle.inject( g, "X" ) if t == "G"
      check.init
      check.check(a,b,c,d,e,f,g,"X")
      @win = check.getwin
    end
    
  end
  
  def start
    a = [0, 0, 0, 0, 0, 0]
    b = [0, 0, 0, 0, 0, 0]
    c = [0, 0, 0, 0, 0, 0]
    d = [0, 0, 0, 0, 0, 0]
    e = [0, 0, 0, 0, 0, 0]
    f = [0, 0, 0, 0, 0, 0]
    g = [0, 0, 0, 0, 0, 0]
    puts "connect_four start"
    puts "user1 ---- #, user2 ---- X"
    settle = Settle.new
    check = Scoreboard.new
    while (@win == 0) do
      puts"user one, it's your turn,choose a column from A to G(Caution, use uppercase word)"
      t = gets.chomp 
      while (!["A","B","C","D","E","F","G"].include?(t)) do
        print"the input is not available, enter another"
        t = gets.chomp
      end
      a = settle.inject( a, "#" ) if t == "A"
      b = settle.inject( b, "#" ) if t == "B"
      c = settle.inject( c, "#" ) if t == "C"
      d = settle.inject( d, "#" ) if t == "D"
      e = settle.inject( e, "#" ) if t == "E"
      f = settle.inject( f, "#" ) if t == "F"
      g = settle.inject( g, "#" ) if t == "G"
      check.init
      check.check(a,b,c,d,e,f,g,"#")
      @win = check.getwin
      puts"user two, it's your turn,choose a column from A to G(Caution: use uppercase word)"
      t = gets.chomp 
      while (!["A","B","C","D","E","F","G"].include?(t)) do
        print"the input is not available, enter another"
        t = gets.chomp
      end
      a = settle.inject( a, "X" ) if t == "A"
      b = settle.inject( b, "X" ) if t == "B"
      c = settle.inject( c, "X" ) if t == "C"
      d = settle.inject( d, "X" ) if t == "D"
      e = settle.inject( e, "X" ) if t == "E"
      f = settle.inject( f, "X" ) if t == "F"
      g = settle.inject( g, "X" ) if t == "G"
      check.init
      check.check(a,b,c,d,e,f,g,"X")
      @win = check.getwin
    end
    
  end
  
end

a = Game.new
a.init
a.menu
end
=begin
a = Settle.new
a.inject([1,2,3,1,2,2],"#")
print(a.get)
end
A = [1, 1, 0, 0, 0, 0]
B = [1, 1, 1, 0, 0, 0]
C = [0, 0, 0, 1, 0, 0]
D = [1, 1, 1, 0, 0, 0]
E = [1, 1, 1, 1, 0, 0]
F = [1, 0, 0, 0, 0, 0]
G = [1, 1, 1, 0, 0, 0]

a = Scoreboard.new
a.init
a.check(A,B,C,D,E,F,G,1)
end
=end