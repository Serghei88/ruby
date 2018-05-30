def longest_common_seq(str1, str2)
  shortest = []
  longest = []
  sequence = ''
  if str1.size > str2.size
    shortest = str2.chars
    longest = str1
  else
    shortest = str1.chars
    longest = str2
  end
  (0..shortest.size).each do |i|
    (0..shortest.size).each do |j|
      seq_to_check = shortest.drop(i).take(j).join('')
      if (longest.include? seq_to_check)
        if sequence.size < seq_to_check.size
          sequence = seq_to_check
        end
      else
        break
      end
    end
  end
  sequence
end
puts longest_common_seq('123', 'asd')
puts longest_common_seq('asdasd', '1asde')
puts longest_common_seq('fghfghasdqwertyasd', 'asdqwerty')
puts longest_common_seq('fghfghasd1234567qwertyasd', 'asd1234567qwerty')

NUCLEOTIDES = %w(A G T C)
chain1 = Array.new(500) { NUCLEOTIDES.sample }.join
chain2 = Array.new(500) { NUCLEOTIDES.sample }.join
require 'benchmark'
puts Benchmark.measure { longest_common_seq(chain1, chain2) }