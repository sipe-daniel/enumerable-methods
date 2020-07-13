array = [1, 2, 3]

module Enumerable

    def my_each
        return to_enum(__method__) unless block_given?
        
        length.times { |i| yield (to_a[i]) }
        self
    end


    def my_each_with_index
        return to_enum(__method__) unless block_given?

        length.times { |index| yield(to_a[index],index) }
        self

    end

    def my_select 
        return to_enum(__method__) unless block_given?
        arr = []
        length.times do |i|

        arr << to_a[i] if yield(to_a[i])

        end
        arr

    end


    def my_all? (arg = nil)

      if block_given?
       validate = false

      my_each do |value|
        validate = true unless yield (value)
      end

       return false if validate
       true

      elsif !block_given? && arg.nil?

      validate2 = false

       my_each do |element|
         validate2 = true unless element
       end
       
       validate2 ? false : true

      else

       check = check_arg(arg)
       return check
      end
end
 
  def check_arg(arg)
    if arg.is_a? (Regexp)
    validator = false
    my_each do |element|
       validator = true if (element.to_s =~ arg).nil?
    end 
    return false if validator
     true
    else 
    puts "regular expresion not recognized"
   end

   end

      
end


