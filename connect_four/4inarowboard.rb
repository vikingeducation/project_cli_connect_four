#each list represents a COLUMN not a row
board = [[1, 'X','O','X','O'],[2, 'O','X','O'],[3, 'X','X','X'],[4,'X','X'],[5],[6],[7]]
index_num = 7
while index_num > -1 do 
  board.each do |list|
    print list[index_num]
  end
  print "\n"
  index_num -= 1
end


#victory algorithm. 

#the code for this will iterate through every column and say something like at board[1][1], check all indexes that are +-1 off that index for the same symbol. then repeat the pattren, so if it was at -1 -1 or +1 +0 do the same thing, if its still the same symbol then repeat until the "same times" counter == 4, if it is, then declare winner.