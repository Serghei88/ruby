class Point
  attr_accessor :id, :name, :ways
  def initialize(id, name, ways)
    @id = id
    @name = name
    @ways = ways
  end
end

class Parser
  attr_accessor :results
  def initialize(allowed_words, graph)
    @results = []
    @graph = graph
    @allowed_words = allowed_words
  end

  def parse_graph
    @allowed_words.each do |word|
      search_word_in_graph(word, @graph)
    end
  end

  def going_to_the_deep(curent_point, word, graph)
    return true if word.empty?
    curent_point.ways.each do |way|
      new_point = graph.find { |point| point.id == way && point.name == word[0] }
      unless new_point.nil?
        graph.delete(new_point)
        return going_to_the_deep(new_point, word[1..-1], graph)
      end
    end
    false
  end

  def search_word_in_graph(word, graph)
    result = false
    posible_starting_points = graph.select { |point| point.name == word[0] }
    posible_starting_points.each do |point|
      tempgraph = graph.clone
      tempgraph.delete(point)
      result = going_to_the_deep(point, word[1..-1], tempgraph)
      @results.push(word) if result
    end
    result
  end
end

parser = Parser.new(%w[pop corn cop cat dog crop popcorn],
                    [Point.new(1, 'p', [2, 3, 4]),
                     Point.new(2, 'o', [1, 3, 5, 6]),
                     Point.new(3, 'r', [1, 2, 4, 6]),
                     Point.new(4, 'n', [1, 3, 6, 7]),
                     Point.new(5, 'p', [2, 6, 8]),
                     Point.new(6, 'o', [2, 3, 4, 5, 7, 8]),
                     Point.new(7, 'c', [4, 6, 8]),
                     Point.new(8, 'c', [5, 6, 7])])
parser.parse_graph

puts 'List of results: ' + parser.results.join(', ')
