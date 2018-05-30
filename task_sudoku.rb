
def sudoku_line_valid?(line)
  line.sort == [1, 2, 3, 4, 5, 6, 7, 8, 9]
end

def sudokku_lines_valid?(sudokku_array)
  result = true
  # check lines
  sudokku_array.each do |line|
    result = false unless sudoku_line_valid?(line)
  end
  puts('check lines: ' + result.to_s)
  result
end

def sudokku_columns_valid?(sudokku_array)
  result = true
  # check columns
  (0..sudokku_array.size - 1).each do |row_number|
    # if rows numbers not equal to column number - this is not sudokku
    return false unless sudokku_array[row_number].size == sudokku_array.size

    temp_column = []
    (0..sudokku_array[row_number].size - 1).each do |column_number|
      temp_column.push(sudokku_array[column_number][row_number])
    end
    result = false unless sudoku_line_valid?(temp_column)
  end
  puts('check columns: ' + result.to_s)
  result
end

def quadrant_valid?(i, j, list)
  temp_list = []
  (i..i + 2).each do |r|
    (j..j + 2).each do |k|
      temp_list.push(list[r][k])
    end
  end
  puts ' checking quadrant i=' + i.to_s + ' to ' + (i + 3).to_s +
       '  j=' + j.to_s + ' to' + (j + 3).to_s + ' result = ' +
       sudoku_line_valid?(temp_list).to_s

  sudoku_line_valid?(temp_list)
end

def sudoku(sudokku_array)
  quadrant_size = 3
  return false unless sudokku_array.size % quadrant_size == 0
  result = sudokku_lines_valid?(sudokku_array) && sudokku_columns_valid?(sudokku_array)

  
  i = 0
  while i < sudokku_array.size
    j = 0
    while j < sudokku_array.size
      result &&= quadrant_valid?(i, j, sudokku_array)
      j += quadrant_size
    end
    i += quadrant_size
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
puts sudoku(testArray)

#puts quadrant_valid?(0,0,testArray)
