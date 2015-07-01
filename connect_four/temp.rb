
def vertical
  piece = @currentboard[row][column] #3,3 on paper
  counter = 1

  #counting in down on the board (not array number) direction

  3.times do |x|
    if @currentboard[row + x][column] == piece
    counter += 1
    else
    break
    end
  end

  if counter >=4
    return true
  end

  return false
end

def horizontal
  piece = @currentboard[row][column] #5,3 on paper
  counter = 1

  # counting in right direction

  3.times do |x|
    if @currentboard[row][column + x] == piece
    counter += 1
    else
    break
    end
  end

  #counting in left direction

  3.times do |x|
    if @currentboard[row][column + x] == piece
    counter += 1
    else
    break
    end
  end


  if counter >=4
    return true
  end

  return false
end

def diagonal_right
  piece = @currentboard[row][column] #5,3 on paper
  counter = 1

  # counting up in right direction

  3.times do |x|
    if @currentboard[row - x][column + x] == piece
    counter += 1
    else
    break
    end
  end

  #counting down in the left direction

  3.times do |x|
    if @currentboard[row + x][column - x] == piece
    counter += 1
    else
    break
    end
  end


  if counter >=4
    return true
  end

  return false
end

def diagonal_left
  piece = @currentboard[row][column] #5,3 on paper
  counter = 1

  # counting up in left direction

  3.times do |x|
    if @currentboard[row - x][column - x] == piece
    counter += 1
    else
    break
    end
  end

  #counting down in the right direction

  3.times do |x|
    if @currentboard[row + x][column + x] == piece
    counter += 1
    else
    break
    end
  end


  if counter >=4
    return true
  end

  return false
end