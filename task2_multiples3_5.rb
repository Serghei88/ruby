def solution(number)
  (number - 1).downto(3).reduce(0) { |result, i| result + (i % 3 == 0 || i % 5 == 0 ? i : 0) }
end

puts solution(10)