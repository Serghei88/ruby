$allowedWords = %w[pop corn cop cat dog crop popcorn]

class Point
  attr_accessor :id, :name, :ways
  def initialize(id, name, ways)
    @id = id
    @name = name
    @ways = ways
  end
end

chain = [Point.new(1, 'p', [2, 3, 4]),
         Point.new(2, 'o', [1, 3, 5, 6]),
         Point.new(3, 'r', [1, 2, 4, 6]),
         Point.new(4, 'n', [1, 3, 6, 7]),
         Point.new(5, 'p', [2, 6, 8]),
         Point.new(6, 'o', [2, 3, 4, 5, 7, 8]),
         Point.new(7, 'c', [4, 6, 8]),
         Point.new(8, 'c', [5, 6, 7])]

$results = []

def recursive(p, tempResult, tempChain)
  $results.push(tempResult) if $allowedWords.include?(tempResult)
  tempChain.delete_if { |obj| obj.id == p.id }
  p.ways.each do |way|
    newPoint = tempChain.find { |item| item.id == way }
    if newPoint
      # puts "starting recursion for " + newPoint.id.to_s + " - " + newPoint.name + " remaining chain : " + tempChain.map {|p| p.id.to_s}.join(" ")
      recursive(newPoint, (tempResult + newPoint.name), tempChain.clone)
    end
  end
end

chain.each do |point|
  # puts "starting recursion for " + point.id.to_s + " - " + point.name + " remaining chain : " + chain.map {|p| p.id.to_s}.join(" ")
  recursive(point, point.name, chain.clone)
end

puts 'List of results: ' + $results.join(', ')
