def longestCommonSeq(str1, str2)
  shortest = []
  longest = []
  sequence = ''
  if str1.size > str2.size
    shortest = str2.split('')
    longest = str1.split('')
  else
    shortest = str1.split('')
    longest = str2.split('')
  end
  for i in 0..shortest.size
    for j in 1..shortest.size - i
      seqToChek = shortest.drop(i).take(j).join('')
      if (longest.join('').include? seqToChek) && sequence.size < seqToChek.size
        sequence = seqToChek
      end
    end
  end
  sequence
end
puts longestCommonSeq('123', 'asd')
puts longestCommonSeq('asdasd', '1asde')
puts longestCommonSeq('asdqwertyasd', 'asdqwerty')
