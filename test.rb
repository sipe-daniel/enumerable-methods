require_relative 'enumerable.rb'

array = [1, 2, 3]

puts 'my_each method'
another_one = []
new_array = array.my_each do |num|
  another_one << num * 2
end


puts 'first test'
[1, 2, 3].my_each { |n| puts "Current number is: #{n}" }

puts 'second test'

puts 'original array'
p array
puts 'new array'
p new_array
puts 'within block array'
p another_one



#----------------------------------------------#

puts '#my_each_with_index'

[5, 10, 15, 20, 25, 30].my_each_with_index do |num, idx|
  
  puts "#{num}"
  if ((idx) % 2 == 0) 
    puts "end of line" 
  end

end

puts "# second test #"

original_arr = [1,2,3]
second_arr = []
second_arr = original_arr.my_each_with_index do |x,i|
  puts "index #{i} -> value #{x + 2}"
end

puts "print the original array"
p original_arr
puts "print the return of my_each_with_index method"
p second_arr



#----------------------------------------------#
