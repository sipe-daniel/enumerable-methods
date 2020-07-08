require_relative 'enumerable.rb'

array = [1, 2, 3]

puts 'my_each method'

new_array = array.my_each do |number|
  number*2
end
puts 'first test'
[1, 2, 3].my_each { |n| puts "Current number is: #{n}" }

puts 'second test'

puts 'original array'
p array
puts 'new array'
p new_array


#----------------------------------------------#

puts '#my_each_with_index'

[5, 10, 15, 20, 25, 30].my_each_with_index do |num, idx|
  
  puts "#{num}"
  if ((idx) % 2 == 0) 
    puts "end of line" 
  end

end

puts "first test"

[5,6,7].my_each_with_index do |x,i|
puts "#{i} -> #{x}"
end
puts "second test"
#----------------------------------------------#