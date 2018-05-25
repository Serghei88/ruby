
def pig_latin(str)
  words = str.split(" ")
  result = ""
  words.each do |word|
    result += word[1..-1] + word[0,1].downcase + "ay "
    
  end
  result[0] = result[0].upcase
  puts result
end

pig_latin("The quick brown fox")


