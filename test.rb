# b[0][6]
# b[0][5],b[1][6]
# b[0][4],b[1][5],b[2][6]

board = [["r", "r", "r"], ["b"], ["b"], ["b"], ["b"], [], ["r"]]


diagonals = []
column = 0 # 0
row = 6 #5
counter = 0
until column > 6
  until row > 6
    diagonals << board[column][row] # 
    row +=1
    column +=1
  end
  counter += 1
  row -= counter
end

p diagonals

# b[0][6], 
# b[0][5], b[1][6]


