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
      validate = false

      if block_given?
      
      my_each { |value| validate = true unless yield (value)}

       return false if validate
       true

      elsif !block_given? && arg.nil?

       my_each { |element| validate = true unless element }
       
       validate ? false : true

      else

       check = arg_check(arg)
       return check

      end
    end
 
  def arg_check(arg)
    if arg.is_a? (Regexp)
    validator = false
    my_each { |element| validator = true if (element.to_s =~ arg).nil? }
    return false if validator
     true
    else 
    puts "no valid pattern parameter"
    end

  end

      
end


