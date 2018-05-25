def solution(number)
result = 0
  (0..number-1).each do |i|
    result+= (i % 3 == 0 || i % 5 ==0) ? i : 0
  end
return result
end