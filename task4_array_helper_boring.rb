require 'rails_helper'
class ArrayHelper

  def self.largestElement(list)
    largest = list.take(1)
    list.each do  |element| 
      if element.size > largest.size
        largest = element
      end
    end
    return largest
  end
  
  def self.reverse(list)
    return list.reverse
  end
  
  def self.checkIfExists(list,element)
    return list.any?{|item| item == element}
  end
  
  def self.doCallback(list,callback)
    list.each do |element|
      callback.call(element)
    end
  end
end

def do_stuff(a)
  puts a
end
testArray = Array.new 

#puts ArrayHelper.largestElement(["a","asa","asdasdasd","234"])
#puts ArrayHelper.reverse(["a","asa","asdasdasd","234"])
#puts ArrayHelper.checkIfExists(["a","asa","asdasdasd","234"], "24")
puts ArrayHelper.doCallback(["a","asa","asdasdasd","234"], method(:do_stuff))