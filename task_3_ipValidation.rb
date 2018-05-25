def isValidIP(str)

    numbers = str.split('.')

    if (numbers.size <=> 4) != 0
      return false
    end
  
    numbers.each do |s|
      if s.to_i < 0 || s.to_i > 255 || (s.start_with?("0") && s.size>1) 
        return false
      end
    end
    return true;
  end
  puts isValidIP("1.2.3.4")
  puts isValidIP("123.45.67.89")
  puts isValidIP("1.2.3")
  puts isValidIP("1.2.3.4.5")
  puts isValidIP("123.045.067.089")