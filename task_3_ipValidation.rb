def valid_ip(str)
  numbers = str.split('.')

  return false unless numbers.size == 4
  numbers.all? { |s| (s.to_i > 0 && s.to_i < 255 && (!s.start_with?('0') && !s.empty?)) }
end
puts valid_ip('1.2.3.4')
puts valid_ip('123.45.67.89')
puts valid_ip('1.2.3')
puts valid_ip('1.2.3.4.5')
puts valid_ip('123.045.067.089')
