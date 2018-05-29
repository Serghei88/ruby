
def checkSudokuLine(line)
  result = true
  (1..9).each do |i|
    result = false unless line.include? i
  end
  result
end

def checkQuadrant(i, j, list)
  tempList = []
  (i..i + 2).each do |r|
    (j..j + 2).each do |k|
      tempList.push(list[r][k])
    end
  end
  checkSudokuLine(tempList)
end

def sudoku(listcolumns)
  result = true
  # check lines
  listcolumns.each do |line|
    result = false unless checkSudokuLine(line)
  end
  puts('check lines: ' + result.to_s)
  # check columns
  (0..listcolumns.size - 1).each do |rowNumber|
    # if rows numbers not equal to column number - this is not sudokku
    return false unless listcolumns[rowNumber].size == listcolumns.size

    tempColumn = []
    (0..listcolumns[rowNumber].size - 1).each do |columnNumber|
      tempColumn.push(listcolumns[columnNumber][rowNumber])
    end
    result = false unless checkSudokuLine(tempColumn)
  end
  puts('check columns: ' + result.to_s)
  # check quadrants, num of columns already equal with num of rows
  return false unless listcolumns.size % 3 == 0
  numOfQuadrantsInLine = listcolumns.size / 3
  i = 0
  while i < listcolumns.size
    j = 0
    while j < listcolumns.size
      puts ' checking quadrant i=' + i.to_s + ' to ' + (i + 3).to_s +
           '  j=' + j.to_s + ' to' + (j + 3).to_s + ' result = ' +
           checkQuadrant(i, j, listcolumns).to_s
      j += 3
    end
    i += 3
  end

  result
end

testArray = [[1, 2, 3, 6, 7, 8, 9, 4, 3],
             [4, 5, 6, 4, 5, 6, 7, 8, 9],
             [8, 9, 7, 4, 5, 6, 7, 8, 9],
             [1, 2, 3, 4, 5, 6, 7, 8, 9],
             [1, 2, 3, 4, 5, 6, 7, 8, 9],
             [1, 2, 3, 4, 5, 6, 7, 8, 9],
             [1, 2, 3, 4, 5, 6, 1, 5, 9],
             [1, 2, 3, 4, 5, 6, 2, 4, 7],
             [1, 2, 3, 4, 5, 6, 3, 6, 8]]
validSudoku = [[4, 3, 5, 2, 6, 9, 7, 8, 1],
               [6, 8, 2, 5, 7, 1, 4, 9, 3],
               [1, 9, 7, 8, 3, 4, 5, 6, 2],
               [8, 2, 6, 1, 9, 5, 3, 4, 7],
               [3, 7, 4, 6, 8, 2, 9, 1, 5],
               [9, 5, 1, 7, 4, 3, 6, 2, 8],
               [5, 1, 9, 3, 2, 6, 8, 7, 4],
               [2, 4, 8, 9, 5, 7, 1, 3, 6],
               [7, 6, 3, 4, 1, 8, 2, 5, 9]]
puts sudoku(validSudoku)
# puts checkQuadrant(0,0,testArray)
