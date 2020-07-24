require_relative 'enumerable.rb'

puts '
#MY_EACH'

a = [ "a", "b", "c" ]
a.my_each {|x| print x, " -- " }
p a

#----------------------------------------------#

puts '
#MY_EACH_WITH_INDEX'

a = [ "a", "b", "c" ]
a.my_each_with_index {|x, index| puts "#{x} --- #{index} "  }

#----------------------------------------------#

puts '
#MY_SELECT'

p [1,2,3,4,5].my_select {|num| num.even? }

a = %w[ a b c d e f ]
p a.my_select {|v| v =~ /[aeiou]/ }

#----------------------------------------------#
puts '
#MY_ALL?'

p %w[ant bear cat].my_all? { |word| word.length >= 3 } 
p %w[ant bear cat].my_all? { |word| word.length >= 4 } 
p %w[ant bear cat].my_all?(/t/)                        
p [1, 2i, 3.14].my_all?(Numeric)                       
p [nil, true, 99].my_all?                              
p [].my_all?

#----------------------------------------------#
puts '#My_ANY?'

p  %w[ant bear cat].my_any? { |word| word.length >= 3 }
p  %w[ant bear cat].my_any? { |word| word.length >= 4 }
p  %w[ant bear cat].my_any?(/d/)
p  [nil, true, 99].my_any?(Integer)
p  [nil, true, 99].my_any?
p  [].my_any?

#----------------------------------------------#
puts '
#MY_NONE'

p %w{ant bear cat}.my_none? { |word| word.length == 5 } 
p %w{ant bear cat}.my_none? { |word| word.length >= 4 } 
p %w{ant bear cat}.my_none?(/d/)                        
p [1, 3.14, 42].my_none?(Float)                        
p [].my_none?                                          
p [nil].my_none?                                        
p [nil, false].my_none?                                 
p [nil, false, true].my_none?  

#----------------------------------------------#
puts '
#MY_COUNT'

p ary = [1, 2, 4, 2]
p ary.my_count                 
p ary.my_count(2)            
p ary.my_count{ |x| x%2==0 }

#----------------------------------------------#
puts '
#MY_MAP'

p (1..4).my_map { |i| i*i }
p (1..4).my_map { "cat" }
#----------------with-proc---------------------#
my_proc = Proc.new { |element| element.even? }
p [4,7,8,9].my_map(&my_proc)

my_proc1 = Proc.new { |elt| elt*elt}
p [1,2,3,4].my_map(&my_proc)

my_proc1 = Proc.new { "cat"}
p [1,2,3,4].my_map(my_proc){ "doc" }

p [1,2,3,4].my_map{ "Lion" }

#----------------------------------------------#
puts '
#MY_INJECT'

p (5..10).my_inject(:+)                             #=> 45
p (5..10).my_inject { |sum, n| sum + n }            #=> 45
p (5..10).my_inject(1, :*)                          #=> 151200
p (5..10).my_inject(1) { |product, n| product * n } #=> 151200
longest = %w{ cat sheep bear }.my_inject do |memo, word|
   memo.length > word.length ? memo : word
end
p longest                                        #=> "sheep"

puts '
#MULTIPLY_ELS'

p [2, 4, 5].multiply_els
