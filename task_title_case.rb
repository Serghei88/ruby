def title_case(title, minor_words="")
    return "" unless minor_words
    result = ""
    titleArray = title.split(" ")
    minor_words_array = minor_words.split(" ")
    
    titleArrayLow = titleArray.map(&:downcase)
    minor_words_arrayLow = minor_words_array.map(&:downcase)

    titleArrayLow.each do |word|
      if  minor_words_arrayLow.include? word
        result += (word+ " ")
      else
        result += (word[0,1].upcase + word[1..-1] + " ")
      end 
    end
    result[0,1] = result[0,1].upcase 
    return result.strip
  end