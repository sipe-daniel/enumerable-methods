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

      length.times { |i| arr << to_a[i] if yield(to_a[i]) }
      arr
    end

    def my_all? (arg = nil)
      if block_given?
        my_each { |value| return false unless yield (value)}
        true

      elsif !block_given? && arg.nil?
        my_each { |element| return false unless element }
        true
      else
        check = arg_all(arg)
        return check

      end
    end


    def my_any? (arg = nil)
      if block_given?
        my_each { |value| return true if yield (value)}
        false

      elsif !block_given? && arg.nil?
        my_each { |element| return true if element }
        false
      else
       check = arg_any(arg)
       return check
      end
    end
    
    def my_none? (arg = nil)
      if block_given?
        my_each { |value| return false if yield (value)}
        true

      elsif !block_given? && arg.nil?
        my_each { |element| return false if element }
        true
      else
       check = !arg_any(arg)
       return check
      end
    end

    def my_count (arg = nil)
      acumulator = 0
      if block_given?
        my_each {|element| acumulator+=1 if yield(element)}
        return acumulator

      elsif !block_given? && arg == nil
        return length

      else 
        my_each { |element| acumulator += 1 if element == arg }
        return acumulator

      end
    end

    def my_map
      return to_enum(__method__) unless block_given?
      new_arr = []
      my_each { |element| new_arr << yield(element) }
      new_arr
  
    end


   
  
 
  def arg_all(arg)
    if arg.is_a?(Regexp)
      my_each {|element| return false if (element.to_s =~ arg).nil? }
      true
    else
       my_each {|element| return false unless element.is_a? arg}
       true
    end
  end

  def arg_any(arg)
    if arg.is_a?(Regexp)
      my_each {|element| return true if element.to_s =~ arg}
      false
    else
      my_each {|element| return true if element.is_a? arg}
      false
    end
  end

      
end


