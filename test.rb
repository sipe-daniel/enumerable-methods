require_relative 'enumerable.rb'

puts "Original arraty"
array = [1, 2, 3, 4, 5, 6, 7]

puts ""
puts '#MY_EACH'
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
puts ""
puts '#MY_EACH_WITH_INDEX'

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
puts  ""
puts "#MY_SELECT"

even_array = []

even_array = array.my_select do |value|
  value.odd?
end
grater_than = []
grater_than = array.my_select do |value|
  value > 4
end

puts "even number return"
p even_array
puts "grater than 4 return"
p grater_than
puts "original array"
p array

#-------------------------------------#
puts  ""
puts "#MY_ALL?"

array2 = ["tapabocas", "trompeta", "toalla"]
validate = array2.my_all?(/t/)

p %w[ant bear cat].my_all? { |word| word.length >= 3 } 
p %w[ant bear cat].my_all? { |word| word.length >= 4 } 
p %w[ant bear cat].my_all?(/t/)                        
p [1, 2i, 3.14].my_all?(Numeric)                       
p [nil, true, 99].my_all?                              
p [].my_all?

p validate

#--------------------------------------#
puts ""
puts "#My_ANY?"

p  %w[ant bear cat].my_any? { |word| word.length >= 3 }
p  %w[ant bear cat].my_any? { |word| word.length >= 4 }
p  %w[ant bear cat].any?(/d/)
p  [nil, true, 99].my_any?(Integer)
p  [nil, true, 99].my_any?
p  [].my_any?

#--------------------#
puts "---none--"
p %w{ant bear cat}.my_none? { |word| word.length == 5 } 
p %w{ant bear cat}.my_none? { |word| word.length >= 4 } 
p %w{ant bear cat}.my_none?(/d/)                        
p [1, 3.14, 42].my_none?(Float)                        
p [].my_none?                                          
p [nil].my_none?                                        
p [nil, false].my_none?                                 
p [nil, false, true].my_none?  

##-##--------------------------------##
puts "
my_count---"

p ary = [1, 2, 4, 2]
p ary.my_count                 
p ary.my_count(2)            
p ary.my_count{ |x| x%2==0 }

