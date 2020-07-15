validator = 0
i = 0
block_regexp = lambda do |element|
  validator += 1 unless (element.to_s =~ arg).nil?
  i += 1
end

block_other = lambda do |element|
  validator += 1 if element.is_a?(arg)
  i += 1
end

if arg.is_a? (Regexp)
   if string == "any"
     my_each(&block)
     validator > 0 ? true : false
   elsif string == "all"
      my_each(&block)
      validator == self.length ? true : false 
   end
   
else 
  my_each(&block_other)

  if string == "any"
     validator > 0 ? true : false

  elsif string == "all"
     if validator == i ? true : false 
      
  end

end
