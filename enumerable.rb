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
      
    validate = 0

    block = Proc.new do |element|
     validate += 1 if yield(element)
    end

    no_block = Proc.new do |element|
      validate += 1 if element
    end

    if block_given?
        my_each(&block)
        return true if validate > 0
        false

    elsif !block_given? && arg.nil?
        my_each(&no_block)
        return true if validate > 0
        false

    else 
        check = arg_check(arg, "any")
        return check
    end
     
    end
    
    def my_none? (arg = nil)
      validate = 0
      block = Proc.new do |element|
        validate += 1 if yield(element)
      end

      no_block = Proc.new do |element|
        validate += 1 if element
      end

      if block_given?
        my_each(&block)
        validate == 0 ? true : false

      elsif !block_given? && arg.nil?
        my_each(&no_block)
        validate == 0 ? true : false

      else 
         check = !arg_check(arg, "any")
         return check
      end
    end

    def my_count (arg = nil)
      acumulator = 0
      if block_given?
        my_each {|element| acumulator+=1 if yield(element)}
        return acumulator

      elsif !block_given? && arg == nil
        length.times {acumulator += 1}
        return acumulator

      else 
        my_each { |element| acumulator += 1 if element == arg }
        return acumulator

      end
    end

    def my_map
      return to_enum(__method__) unless block_given?
      new_arr = []
      my_each { |element| new_arr << element if yield (element) }
      new_arr
  
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


