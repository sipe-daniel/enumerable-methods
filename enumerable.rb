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

       check = arg_check(arg, "all")
       return check

      end
    end


    def my_any? (arg = nil)
      validate = false

      if block_given?
        
        my_each do |element|
        if yield(element)
          validate = true
          break
        end
        end
        return true if validate
        false
      elsif !block_given? && arg.nil?

        my_each do |element|
          if element
            validate = true
            break
          end
        end
        return true if validate
        false
      else 
        check = arg_check(arg, "any")
        return check
      end
     
    end

 
  def arg_check(arg, string = "all")

    validator = 0
    i = 0
    if arg.is_a? (Regexp)
    my_each { |element| 
      validator += 1 if !(element.to_s =~ arg).nil? 
      i += 1
    }
    if string == "any"
      return true if validator > 0
      false
    elsif string == "all"
      return true if validator == i 
      false
    end

    else 
      j = 0
      my_each do |element|
         validator += 1 if element.is_a?(arg)
         j += 1
      end

      if string == "any"
        return true if validator > 0
        false
      elsif string == "all"
        return true if validator == j
        false
      end

    end

  end

      
end


