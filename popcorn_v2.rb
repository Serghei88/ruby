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

def recursive(curentPoint, word, chain)
  return true if word.empty?
  curentPoint.ways.each do |way|
    newPoint = chain.find { |point| point.id == way && point.name == word[0] }
    unless newPoint.nil?
      chain.delete(newPoint)
      return recursive(newPoint, word[1..-1], chain.clone)
    end
  end
  false
end

def searchWordInChain(word, chain)
  result = false
  posibleStartingPoints = chain.select { |point| point.name == word[0] }
  posibleStartingPoints.each do |point|
    tempChain = chain.clone
    tempChain.delete(point)
    result = recursive(point, word[1..-1], tempChain)
    $results.push(word) if result
  end
  result
end

$allowedWords.each do |word|
  searchWordInChain(word, chain.clone)
end

puts 'List of results: ' + $results.join(', ')
